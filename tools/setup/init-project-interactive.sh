#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

read -r -p "Project name: " PROJECT_NAME

echo "Project type:"
echo "1) hardware"
echo "2) software"
echo "3) hardware-software"
read -r -p "Selection [1-3]: " TYPE_SELECTION

case "${TYPE_SELECTION}" in
    1)
        PROJECT_TYPE="hardware"
        ;;
    2)
        PROJECT_TYPE="software"
        ;;
    3)
        PROJECT_TYPE="hardware-software"
        ;;
    *)
        echo "Invalid selection."
        exit 1
        ;;
esac

read -r -p "Short description: " PROJECT_DESCRIPTION
read -r -p "YouTube channel: " CHANNEL_NAME

"${SCRIPT_DIR}/init-project.sh" \
    --name "${PROJECT_NAME}" \
    --type "${PROJECT_TYPE}" \
    --description "${PROJECT_DESCRIPTION}" \
    --channel "${CHANNEL_NAME}"
