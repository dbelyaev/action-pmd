# action-pmd

<!-- badges -->
[![Test](https://github.com/dbelyaev/action-pmd/workflows/Test/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/dbelyaev/action-pmd/workflows/reviewdog/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/dbelyaev/action-pmd/workflows/depup/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3Adepup)
[![release](https://github.com/dbelyaev/action-pmd/workflows/release/badge.svg)](https://github.com/dbelyaev/action-pmd/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/dbelyaev/action-pmd?logo=github&sort=semver)](https://github.com/dbelyaev/action-pmd/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

This is a GitHub action to run [PMD](https://pmd.github.io/) checks on your code and report the status via [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests.

## Example

An example of how the reported PMD violations will look on a pull request is shown below ([link to example PR](TODO ADD)):

![PR comment with violation](TODO ADD IMAGE)

## Usage

```yaml
name: reviewdog
on: [pull_request]
jobs:
  checkstyle:
    name: runner / pmd
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dbelyaev/action-pmd@v0.0.1
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review
          level: warning
```

## Input parameters

### PMD parameters

* ### `rulesets_path`  

  Path to the ruleset xml file.

   For more information, check [PMD / options / rulesets](https://docs.pmd-code.org/latest/pmd_userdocs_cli_reference.html#options) documentation.

  **`Default:`**  `rulesets/java/quickstart.xml`

  **`Example:`**

  ```yaml
  name: reviewdog
  on: [pull_request]
  jobs:
    checkstyle:
      name: runner / checkstyle
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v4
        - uses: dbelyaev/action-checkstyle@master
          with:
            github_token: ${{ secrets.github_token }}
            reporter: github-pr-review
            rulesets_path: rulesets/java/quickstart.xml
  ```

  Link to [example PR](TODO ADD).

* ### `workdir`

  The working directory relative to the root directory.

  **`Default:`** `.` (root)

### Reviewdog parameters

* ### `level`

  Report level for the reviewdog command.
  
  **`Values:`** `[info, warning, error]`
  
  You can control GitHub status check result with this feature.

  | Level     | GitHub Status |
  | --------- | ------------- |
  | `info`    | neutral       |
  | `warning` | neutral       |
  | `error`   | failure       |

  **`Default:`** `info`

* ### `reporter`

  Reporter for the reviewdog command.  

  For more information, check [reviewdog / reporters](https://github.com/reviewdog/reviewdog#reporters) documentation.

  **`Values:`** `[github-pr-check, github-check, github-pr-review]`

  **`Default:`** `github-pr-check`

* ### `filter_mode`

  Filtering mode for the reviewdog command.  

  For more information, check [reviewdog / filter-mode](https://github.com/reviewdog/reviewdog#filter-mode) documentation.

  **`Values:`** `[added, diff_context, file, nofilter]`

  **`Default:`** `added`

* ### `fail_on_error`

  Exit code for reviewdog when errors are found.

  **`Values:`** `[true, false]`

  **`Default:`** `false`

* ### `reviewdog_flags`

  Additional reviewdog flags.

  **`Default:`** ``
