#!/usr/bin/env bash
# If a command fails then the deploy stops
set -e

## Hack
rm -f static/ltximg/*

DEBUG_MODE=false
PAGEFIND=true

while [ $# -gt 0 ];
do
    case "$1" in
        --debug)
            DEBUG_MODE=true
            shift
            ;;
        --no-pagefind)
            PAGEFIND=false
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
        *)
            STARTER="$1"
            shift
            ;;
    esac
done

# Ensure Tailwind CLI exists in starter (required for Hugo css.TailwindCSS)
if [ -f "package.json" ] && [ ! -x "node_modules/.bin/tailwindcss" ]; then
    echo "📦 Installing Tailwind CLI in starter directory for Hugo..."
    if command -v pnpm >/dev/null 2>&1; then
        pnpm install
    else
        npm install
    fi
fi

rm -rf ../static/pagefind
# Optionally pre-build and generate Pagefind index for local search
if [ "$PAGEFIND" = true ]
then
    hugo
    if command -v pnpm >/dev/null 2>&1; then
        pnpm dlx pagefind --site "public" --output-subdir ../static/pagefind
    else
        npm_config_yes=true npx pagefind --site "public" --output-subdir ../static/pagefind
    fi
fi

# Compose Hugo server args
HUGO_ARGS=(
    server
    --disableFastRender
    --printI18nWarnings
    --printPathWarnings
    --gc
    -F
    # --port 8081
    # --bind 0.0.0.0
)

if [ "$DEBUG_MODE" = true ]; then
    HUGO_ARGS+=(
        --logLevel debug
        --panicOnWarning
        --templateMetrics
        --templateMetricsHints
        --ignoreCache
        --noHTTPCache
        --renderStaticToDisk
        -D
        -E
    )
fi

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

hugo "${HUGO_ARGS[@]}"



# Build the project.
hugo --minify

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [[ -n "$*" ]]
then
    msg="$*"
fi

git commit -am "$msg"

# Push source and build repos.
git push origin master
