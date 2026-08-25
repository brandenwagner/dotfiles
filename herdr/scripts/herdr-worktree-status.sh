#!/usr/bin/env bash
# Show the status of every herdr worktree for a repo and how each branch
# relates to origin/<base> (ahead/behind counts, dirty state).
#
# Usage: herdr-worktree-status.sh [--cwd PATH] [--base BRANCH] [--fetch]
#   --cwd PATH    path inside the repo to inspect (default: current directory)
#   --base BRANCH branch to compare against, e.g. "main" (default: main)
#   --fetch       run `git fetch origin <base>` before comparing
#
# Requires: herdr CLI (HERDR_ENV=1), jq
set -euo pipefail

if [[ "${HERDR_ENV:-}" != "1" ]]; then
  echo "error: not running inside Herdr (HERDR_ENV != 1)" >&2
  exit 1
fi

REPO_CWD="$PWD"
BASE="main"
DO_FETCH=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --cwd) REPO_CWD="$2"; shift 2 ;;
    --base) BASE="$2"; shift 2 ;;
    --fetch) DO_FETCH=1; shift ;;
    *) echo "error: unknown argument '$1'" >&2; exit 1 ;;
  esac
done

list_json="$(herdr worktree list --cwd "$REPO_CWD")"
repo_root="$(jq -r '.result.source.repo_root' <<<"$list_json")"

if [[ -z "$repo_root" || "$repo_root" == "null" ]]; then
  echo "error: could not resolve repo root from '${REPO_CWD}'" >&2
  exit 1
fi

if [[ "$DO_FETCH" -eq 1 ]]; then
  echo "==> fetching origin/${BASE}" >&2
  git -C "$repo_root" fetch origin "$BASE"
fi

upstream="origin/${BASE}"

printf '%-14s %-32s %-9s %-8s %-8s %s\n' "LABEL" "BRANCH" "DIRTY" "AHEAD" "BEHIND" "PATH"

jq -r '.result.worktrees[] | [.label, .branch, .path, .is_detached] | @tsv' <<<"$list_json" |
while IFS=$'\t' read -r label branch path is_detached; do
  if [[ "$is_detached" == "true" ]]; then
    branch="(detached)"
  fi

  if git -C "$path" rev-parse --verify --quiet "$upstream" >/dev/null; then
    read -r behind ahead <<<"$(git -C "$path" rev-list --left-right --count "${upstream}...HEAD" 2>/dev/null)"
  else
    behind="?"
    ahead="?"
  fi

  if [[ -n "$(git -C "$path" status --porcelain 2>/dev/null)" ]]; then
    dirty="dirty"
  else
    dirty="clean"
  fi

  printf '%-14s %-32s %-9s %-8s %-8s %s\n' "$label" "$branch" "$dirty" "$ahead" "$behind" "$path"
done
