#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VENV_PATH="${PROJECT_ROOT}/.venv"

echo "Project root: ${PROJECT_ROOT}"

if ! command -v python3 >/dev/null 2>&1; then
    echo "Error: python3 is not installed."
    exit 1
fi

if [[ ! -d "${VENV_PATH}" ]]; then
    echo "Creating Python virtual environment ..."
    python3 -m venv "${VENV_PATH}"
fi

"${VENV_PATH}/bin/python" -m pip install --upgrade pip

if [[ -f "${PROJECT_ROOT}/requirements-dev.txt" ]]; then
    "${VENV_PATH}/bin/python" -m pip install \
        -r "${PROJECT_ROOT}/requirements-dev.txt"
fi

echo
echo "Development environment is ready."
echo "Activate it with:"
echo "source .venv/bin/activate"
