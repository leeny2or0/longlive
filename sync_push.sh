#!/bin/zsh
# Commit everything in this repo (notebook + outputs you generate here) and push.
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/homebrew/bin"
REPO="$HOME/longlive"
export GIT_SSH_COMMAND="ssh -i $HOME/.ssh/id_ed25519 -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new"
cd "$REPO" || exit 1
git add -A
if ! git diff --cached --quiet; then
  git commit -q -m "auto-sync $(date '+%Y-%m-%d %H:%M:%S')"
fi
git push -u origin main 2>&1
