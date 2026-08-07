| Name | Link |
|---|---|
| Events that trigger workflows | https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows |
| GitHub-hosted runners | https://docs.github.com/en/actions/reference/runners/github-hosted-runners |
| Actions marketplace | https://github.com/marketplace?type=actions |
| Crontab guru | https://crontab.cronhub.io/ |
| Runs-on syntax | https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idruns-on |
| Using a specific shell | https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#using-a-specific-shell |
| Expressions - functions | https://docs.github.com/en/actions/reference/workflows-and-actions/expressions#functions |
| Contexts | https://docs.github.com/en/actions/reference/workflows-and-actions/contexts |

## Expression functions

| Function | Description |
|---|---|
| `contains(search, item)` | Returns `true` if `search` contains `item` (substring, or element of an array). |
| `startsWith(searchString, searchValue)` | Returns `true` if `searchString` starts with `searchValue` (case-insensitive). |
| `endsWith(searchString, searchValue)` | Returns `true` if `searchString` ends with `searchValue` (case-insensitive). |
| `format(string, replaceValue0, ..., replaceValueN)` | Replaces `{0}`, `{1}`, ... placeholders in `string` with the given values. |
| `join(array, optionalSeparator)` | Concatenates all values in `array` into a string, separated by `optionalSeparator` (default `,`). |
| `toJSON(value)` | Returns a pretty-print JSON representation of `value` — handy for debugging contexts. |
| `fromJSON(value)` | Parses a JSON string into an object/array/number/boolean so it can be used in expressions. |
| `hashFiles(path)` | Returns a single hash for the set of files matching the `path` glob — used for cache keys. |

### Status check functions

| Function | Description |
|---|---|
| `success()` | Returns `true` when all previous steps have succeeded. |
| `always()` | Always returns `true`, so the step runs even on failure or cancellation. |
| `cancelled()` | Returns `true` if the workflow was cancelled. |
| `failure()` | Returns `true` when any previous step of the job has failed. |

## Contexts

| Context | Description |
|---|---|
| `github` | Information about the workflow run — event payload, repository, ref, actor, commit SHA. |
| `env` | Variables set at the workflow, job, or step level. |
| `vars` | Variables set at the repository, organization, or environment level. |
| `job` | Information about the currently running job, including containers and services. |
| `jobs` | Reusable workflows only — the outputs of jobs from the reusable workflow. |
| `steps` | Outputs and status (`conclusion`, `outcome`) of steps already run in the current job. |
| `runner` | Information about the runner executing the job — `os`, `arch`, `temp`, `tool_cache`. |
| `secrets` | Names and values of secrets available to the workflow run. |
| `strategy` | Information about the matrix execution strategy for the current job. |
| `matrix` | The matrix properties that apply to the current job. |
| `needs` | Outputs and results of all jobs the current job depends on. |
| `inputs` | Inputs of a reusable workflow or a manually triggered (`workflow_dispatch`) workflow. |
