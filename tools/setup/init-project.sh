#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

usage() {
    cat <<USAGE
Usage:
  $0 --name "Project name" \
     --type hardware-software \
     --description "Description" \
     --channel "Channel name"

Project types:
  hardware
  software
  hardware-software
USAGE
}

PROJECT_NAME=""
PROJECT_TYPE=""
PROJECT_DESCRIPTION=""
CHANNEL_NAME=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --name)
            PROJECT_NAME="${2:-}"
            shift 2
            ;;
        --type)
            PROJECT_TYPE="${2:-}"
            shift 2
            ;;
        --description)
            PROJECT_DESCRIPTION="${2:-}"
            shift 2
            ;;
        --channel)
            CHANNEL_NAME="${2:-}"
            shift 2
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            echo "Unknown parameter: $1"
            usage
            exit 1
            ;;
    esac
done

if [[ -z "${PROJECT_NAME}" ]]; then
    echo "Error: --name is missing."
    usage
    exit 1
fi

if [[ -z "${PROJECT_TYPE}" ]]; then
    echo "Error: --type is missing."
    usage
    exit 1
fi

case "${PROJECT_TYPE}" in
    hardware|software|hardware-software)
        ;;
    *)
        echo "Error: Invalid project type '${PROJECT_TYPE}'."
        exit 1
        ;;
esac

if [[ -z "${PROJECT_DESCRIPTION}" ]]; then
    PROJECT_DESCRIPTION="Electronics learning project from the initial idea to the technical implementation."
fi

if [[ -z "${CHANNEL_NAME}" ]]; then
    CHANNEL_NAME="MawjaLab"
fi

PROJECT_SLUG="$(
    printf '%s' "${PROJECT_NAME}" \
        | iconv -f UTF-8 -t ASCII//TRANSLIT \
        | tr '[:upper:]' '[:lower:]' \
        | sed 's/[^a-z0-9]/-/g' \
        | sed 's/-\+/-/g' \
        | sed 's/^-//' \
        | sed 's/-$//'
)"

if [[ -z "${PROJECT_SLUG}" ]]; then
    echo "Error: Could not generate a valid project slug."
    exit 1
fi

echo "Initializing project:"
echo "  Name:        ${PROJECT_NAME}"
echo "  Slug:        ${PROJECT_SLUG}"
echo "  Type:        ${PROJECT_TYPE}"
echo "  Description: ${PROJECT_DESCRIPTION}"
echo "  Channel:     ${CHANNEL_NAME}"

replace_placeholders() {
    find "${PROJECT_ROOT}" \
        -type f \
        \( \
            -name '*.md' \
            -o -name '*.yaml' \
            -o -name '*.yml' \
            -o -name '*.json' \
            -o -name '*.jsonc' \
            -o -name '*.txt' \
        \) \
        -not -path "${PROJECT_ROOT}/.git/*" \
        -not -path "${PROJECT_ROOT}/.venv/*" \
        -print0 |
    while IFS= read -r -d '' file; do
        sed -i \
            -e "s|PROJECT_NAME|${PROJECT_NAME}|g" \
            -e "s|PROJECT_SLUG|${PROJECT_SLUG}|g" \
            -e "s|PROJECT_TYPE|${PROJECT_TYPE}|g" \
            -e "s|PROJECT_DESCRIPTION|${PROJECT_DESCRIPTION}|g" \
            -e "s|YOUTUBE_CHANNEL|${CHANNEL_NAME}|g" \
            "${file}"
    done
}

configure_project_type() {
    case "${PROJECT_TYPE}" in
        hardware)
            rm -rf "${PROJECT_ROOT}/software"
            ;;
        software)
            rm -rf \
                "${PROJECT_ROOT}/hardware" \
                "${PROJECT_ROOT}/mechanical" \
                "${PROJECT_ROOT}/docs/03-hardware" \
                "${PROJECT_ROOT}/docs/05-manufacturing" \
                "${PROJECT_ROOT}/docs/06-bring-up"
            ;;
        hardware-software)
            ;;
    esac
}

copy_brand_assets() {
    local search_dir brand_root=""
    search_dir="$(dirname "${PROJECT_ROOT}")"
    while [[ "${search_dir}" != "/" ]]; do
        if [[ -f "${search_dir}/brand/BRAND-CORE.md" ]]; then
            brand_root="${search_dir}/brand"
            break
        fi
        search_dir="$(dirname "${search_dir}")"
    done

    if [[ -z "${brand_root}" ]]; then
        echo "WARNING: MawjaLab brand workspace not found in any ancestor directory."
        echo "         Copy the brand assets into media/brand/ manually"
        echo "         (see the Brand Setup checklist in PROJECT.md)."
        return 0
    fi

    # The M monogram (mawjalab-mark-m.svg) is archived and deliberately excluded.
    local assets=(
        "mawjalab-mark-pulse.svg"
        "mawjalab-mark-trace.svg"
        "mawjalab-lockup.svg"
        "mawjalab-watermark-white.svg"
        "templates/README.md"
        "templates/thumbnail-flagship.svg"
        "templates/thumbnail-clip.svg"
        "templates/short-hook.svg"
        "templates/lowerthird.svg"
        "templates/kapitelkarte-01.svg"
        "templates/kapitelkarte-02.svg"
        "templates/kapitelkarte-03.svg"
        "templates/kapitelkarte-04.svg"
        "templates/kapitelkarte-05.svg"
        "export/kapitelkarte-01.png"
        "export/kapitelkarte-02.png"
        "export/kapitelkarte-03.png"
        "export/kapitelkarte-04.png"
        "export/kapitelkarte-05.png"
        "export/lowerthird-1920x1080.png"
        "export/watermark-150.png"
    )

    local asset target
    for asset in "${assets[@]}"; do
        if [[ -f "${brand_root}/assets/${asset}" ]]; then
            target="${PROJECT_ROOT}/media/brand/${asset}"
            mkdir -p "$(dirname "${target}")"
            cp "${brand_root}/assets/${asset}" "${target}"
        else
            echo "WARNING: brand asset not found: ${asset}"
        fi
    done
    echo "Brand assets copied into media/brand/."
}

remove_template_files() {
    rm -f "${PROJECT_ROOT}/TEMPLATE-INSTRUCTIONS.md"
}

replace_placeholders
configure_project_type
copy_brand_assets
remove_template_files

echo
echo "Project initialized."
echo
echo "Next steps:"
echo "  1. Review project.yaml"
echo "  2. Review README.md"
echo "  3. Work through the Brand Setup checklist in PROJECT.md"
echo "  4. Fill in docs/00-project-overview"
echo "  5. git add ."
echo "  6. git commit -m \"Initialize ${PROJECT_NAME}\""
