#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ERROR_COUNT=0

required_files=(
    "README.md"
    "PROJECT.md"
    "project.yaml"
    ".gitignore"
    "CLAUDE.md"
    "AGENTS.md"
)

required_directories=(
    "docs"
    "media"
    "tools/setup"
    "tools/validation"
)

for file in "${required_files[@]}"; do
    if [[ ! -f "${PROJECT_ROOT}/${file}" ]]; then
        echo "MISSING: ${file}"
        ERROR_COUNT=$((ERROR_COUNT + 1))
    fi
done

for directory in "${required_directories[@]}"; do
    if [[ ! -d "${PROJECT_ROOT}/${directory}" ]]; then
        echo "MISSING: ${directory}/"
        ERROR_COUNT=$((ERROR_COUNT + 1))
    fi
done

# tools/ is excluded: the setup scripts contain the placeholder strings
# as variable names and would trigger a permanent false positive.
if grep -R \
    --exclude-dir=.git \
    --exclude-dir=.venv \
    --exclude-dir=tools \
    -E 'PROJECT_NAME|PROJECT_SLUG|PROJECT_TYPE|PROJECT_DESCRIPTION|YOUTUBE_CHANNEL' \
    "${PROJECT_ROOT}" >/dev/null 2>&1; then
    echo "NOTE: Unreplaced template placeholders found."
fi

if grep -Rn \
    --exclude-dir=.git \
    --exclude-dir=.venv \
    --exclude-dir=.claude \
    --exclude='validate-template.sh' \
    '/home/' \
    "${PROJECT_ROOT}"; then
    echo "ERROR: Absolute local paths found (matches above). Projects are public — remove them."
    ERROR_COUNT=$((ERROR_COUNT + 1))
fi

if [[ ! -f "${PROJECT_ROOT}/media/brand/mawjalab-mark-trace.svg" ]]; then
    echo "NOTE: Brand assets missing in media/brand/ — run tools/setup/init-project.sh inside the brand workspace or copy them manually (Brand Setup checklist in PROJECT.md)."
fi

if [[ "${ERROR_COUNT}" -gt 0 ]]; then
    echo "Validation failed: ${ERROR_COUNT} error(s)."
    exit 1
fi

echo "Template structure is valid."
