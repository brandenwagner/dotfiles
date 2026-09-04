#!/usr/bin/env bash
# Create 4 herdr worktrees on the kortex repo, one per workstream,
# rename each worktree's first pane to match the worktree name, and launch
# a Claude Code instance in that pane.
#
# Requires: herdr CLI (HERDR_ENV=1), jq
set -euo pipefail

# --- fill in for your environment -------------------------------------
REPO_CWD="/Users/branden/Repositories/Mercury/kortex" # cwd inside the kortex repo (used to resolve --cwd for each worktree)
BASE_REF="main"                                              # e.g. "main" — leave empty to use herdr's default (skips the fetch/up-to-date guarantee below)
# ------------------------------------------------------------------------

if [[ "${HERDR_ENV:-}" != "1" ]]; then
  echo "error: not running inside Herdr (HERDR_ENV != 1)" >&2
  exit 1
fi

# Update remote refs without touching whatever branch is checked out in
# REPO_CWD itself — each worktree below branches off origin/$BASE_REF
# directly, so the primary checkout's working state is never disturbed.
if [[ -n "$BASE_REF" ]]; then
  echo "==> fetching latest origin/${BASE_REF}"
  git -C "$REPO_CWD" fetch origin "$BASE_REF"
  BASE_REF="origin/${BASE_REF}"
fi

# name:branch:subdir triples — subdir is where Claude is launched, relative
# to the worktree root
WORKTREES=(
  "tprm:tprm:services/tprm-app"
  "access:access:services/access-app"
  "devices:devices:services/devices-app"
  "help-desk:help-desk:services/help-desk-app"
)

existing_branches="$(herdr worktree list --cwd "$REPO_CWD" | jq -r '.result.worktrees[].branch')"

for entry in "${WORKTREES[@]}"; do
  IFS=':' read -r name branch subdir <<<"$entry"

  if grep -qxF "$branch" <<<"$existing_branches"; then
    echo "==> skipping '${name}': a worktree for branch '${branch}' already exists"
    continue
  fi

  echo "==> creating worktree '${name}' (branch: ${branch})"

  args=(worktree create --cwd "$REPO_CWD" --branch "$branch" --label "$name" --focus)
  if [[ -n "$BASE_REF" ]]; then
    args+=(--base "$BASE_REF")
  fi

  response="$(herdr "${args[@]}")"

  pane_id="$(jq -r '.result.root_pane.pane_id // .result.pane.pane_id // empty' <<<"$response")"
  worktree_path="$(jq -r '.result.worktree.path // empty' <<<"$response")"

  if [[ -z "$pane_id" || -z "$worktree_path" ]]; then
    echo "error: could not determine pane id or worktree path for worktree '${name}'" >&2
    echo "$response" >&2
    exit 1
  fi

  launch_dir="$worktree_path"
  if [[ -n "$subdir" ]]; then
    launch_dir="${worktree_path}/${subdir}"
  fi

  herdr pane rename "$pane_id" "$name"
  herdr pane run "$pane_id" bash -lc "cd \"$launch_dir\" && exec claude --remote-control \"$name\""

  echo "==> worktree '${name}' ready (pane: ${pane_id})"
done
