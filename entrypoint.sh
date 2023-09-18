#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
  git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit 1
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

chmod +x /usr/local/bin/pmd/bin/pmd
alias pmd="/usr/local/bin/pmd/bin/pmd"

reviewdog --version
java --version
pmd --version

exec pmd check --no-progress --no-cache --dir "${INPUT_WORKDIR}" --rulesets "${INPUT_RULESETS_PATH}" --format emacs \
  | reviewdog -efm="%f:%l: %m" \
      -name="pmd" \
      -reporter="${INPUT_REPORTER:-github-pr-check}" \
      -filter-mode="${INPUT_FILTER_MODE:-added}" \
      -fail-on-error="${INPUT_FAIL_ON_ERROR:-false}" \
      -level="${INPUT_LEVEL}" \
      ${INPUT_REVIEWDOG_FLAGS} -
