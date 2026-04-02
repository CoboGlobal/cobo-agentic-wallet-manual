#!/usr/bin/env bash
# Sync mintlify docs from cobo-agent-wallet to this repo and open a PR.
#
# Usage:
#   ./scripts/sync.sh
#
# Prerequisites:
#   - gh CLI authenticated (gh auth login)
#   - SOURCE_PATH env var set, or defaults to the path below
#
# Secrets needed for GitHub Actions (see .github/workflows/sync-docs.yml):
#   INTERNAL_REPO_SSH_KEY  — SSH private key with read access to code.1cobo.com
#   GH_PAT                 — GitHub PAT with repo scope for opening PRs in upstream

set -euo pipefail

SOURCE_PATH="${SOURCE_PATH:-/Users/rebeccacao/Documents/github/cobo-agent-wallets/cobo-agent-wallet/mintlify}"
DEST="$(cd "$(dirname "$0")/.." && pwd)"
UPSTREAM_REPO="CoboGlobal/cobo-agentic-wallet-manual"
BRANCH="sync/docs-$(date +%Y%m%d-%H%M%S)"

cd "$DEST"

# Ensure we start from master and it's clean
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "$CURRENT_BRANCH" != "master" ]; then
  echo "ERROR: Must be on master branch (currently on $CURRENT_BRANCH). Aborting." >&2
  exit 1
fi

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "ERROR: Working tree has uncommitted changes. Aborting." >&2
  exit 1
fi

echo "Syncing from: $SOURCE_PATH"
echo "Destination:  $DEST"

rsync -av --delete \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='scripts/' \
  --exclude='.github/' \
  "$SOURCE_PATH/" "$DEST/"

# Check for changes
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "Nothing to sync — docs are already up to date."
  exit 0
fi

SOURCE_COMMIT="$(git -C "$SOURCE_PATH" rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

git checkout -b "$BRANCH"
git add -A
git commit -m "sync: update docs from cobo-agent-wallet mintlify

Source: cobo-agent-wallets@${SOURCE_COMMIT}"

git push origin "$BRANCH"

gh pr create \
  --repo "$UPSTREAM_REPO" \
  --title "sync: update docs from cobo-agent-wallet mintlify" \
  --body "$(cat <<EOF
Automated sync from \`cobo-agent-wallet/mintlify\`.

**Source commit:** \`${SOURCE_COMMIT}\`

---
_Created by [scripts/sync.sh](scripts/sync.sh)_
EOF
)" \
  --base master \
  --head "rcsh1:${BRANCH}"

echo "PR opened to $UPSTREAM_REPO from branch $BRANCH"
