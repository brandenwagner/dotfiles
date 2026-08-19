#!/usr/bin/env bash
# Create 4 herdr worktrees on the konstellation repo, one per workstream,
# and rename each worktree's first pane to match the worktree name.
#
# Requires: herdr CLI (HERDR_ENV=1), jq
set -euo pipefail

# --- fill in for your environment -------------------------------------
REPO_CWD="/Users/branden/Repositories/Mercury/konstellation" # cwd inside the konstellation repo (used to resolve --cwd for each worktree)
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

# name:branch pairs — fill in real branch names as needed
WORKTREES=(
  "tprm:tprm"
  "access:access"
  "devices:devices"
  "help-desk:help-desk"
)

existing_branches="$(herdr worktree list --cwd "$REPO_CWD" | jq -r '.result.worktrees[].branch')"

for entry in "${WORKTREES[@]}"; do
  name="${entry%%:*}"
  branch="${entry##*:}"

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

  if [[ -z "$pane_id" ]]; then
    echo "error: could not determine pane id for worktree '${name}'" >&2
    echo "$response" >&2
    exit 1
  fi

  herdr pane rename "$pane_id" "$name"

  echo "==> worktree '${name}' ready (pane: ${pane_id})"
done
