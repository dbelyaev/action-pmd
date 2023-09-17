# action-pmd

<!-- badges -->
[![Test](https://github.com/dbelyaev/action-pmd/workflows/Test/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/dbelyaev/action-pmd/workflows/reviewdog/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/dbelyaev/action-pmd/workflows/depup/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3Adepup)
[![release](https://github.com/dbelyaev/action-pmd/workflows/release/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/dbelyaev/action-pmd?logo=github&sort=semver)](https://github.com/dbelyaev/action-pmd/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

![github-pr-review demo](https://user-images.githubusercontent.com/3797062/73162963-4b8e2b00-4132-11ea-9a3f-f9c6f624c79f.png)
![github-pr-check demo](https://user-images.githubusercontent.com/3797062/73163032-70829e00-4132-11ea-8481-f213a37db354.png)

This is a template repository for [reviewdog](https://github.com/reviewdog/reviewdog) action with release automation.
Click `Use this template` button to create your reviewdog action :dog:!

If you want to create your own reviewdog action from scratch without using this
template, please check and copy release automation flow.
It's important to manage release workflow and sync reviewdog version for all
reviewdog actions.

This repo contains a sample action to run [misspell](https://github.com/client9/misspell).

## Input

<!-- TODO: update -->
```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN'
    default: '${{ github.token }}'
  workdir:
    description: 'Working directory relative to the root directory.'
    default: '.'
  ### Flags for reviewdog ###
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: 'Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].'
    default: 'github-pr-check'
  filter_mode:
    description: |
      Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
      Default is added.
    default: 'added'
  fail_on_error:
    description: |
      Exit code for reviewdog when errors are found [true,false]
      Default is `false`.
    default: 'false'
  reviewdog_flags:
    description: 'Additional reviewdog flags'
    default: ''
  ### Flags for pmd ###
  locale:
    description: '-locale flag of misspell. (US/UK)'
    default: ''
```

## Usage

```yaml
name: reviewdog
on: [pull_request]
jobs:
  linter_name:
    name: runner / pmd
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dbelyaev/action-pmd@v1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review
          level: warning
```
