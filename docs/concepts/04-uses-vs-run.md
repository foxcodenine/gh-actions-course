# Notes: `uses:` vs `run:` and what `actions/checkout` does

My own beginner notes for section 04.

---

## What happens when a workflow runs

When you push code, GitHub gives you a **brand new, empty computer** (a "runner").
Think of it as a fresh laptop that just booted up for the first time.

That computer has Linux, git, Node, etc. installed — but it does **not** have your
project files on it. It's empty. It only knows one thing: *"a push happened in the
repo `foxcodenine/gh-actions-course`."*

Your job in a workflow is to write the list of commands that computer should run.
That's what `steps:` is.

---

## Two ways to write a step

The two steps in `.github/workflows/04-using-actions.yaml` are different kinds:

```yaml
- name: Checkout code
  uses: actions/checkout@v7      # ← step type 1

- name: Printing Folder
  run: ls                        # ← step type 2
```

**`run:`** = "type this command into the terminal."
`ls` is just the normal Linux command that lists files. Simple.

**`uses:`** = "go download somebody else's ready-made script from GitHub, and run that."
It's like installing a package instead of writing the code yourself. Someone already
solved this problem, published it, and you're borrowing it.

---

## So what is `actions/checkout`?

It's a ready-made script whose one job is: **copy my repository's files onto this
empty computer.**

("Checkout" is the git word for it — same idea as `git checkout`.)

The name is just an address on GitHub:

```
actions / checkout @ v7
  ↑         ↑        ↑
  who       what     which version
  made it   it is
```

- `actions` → the account that owns it. This one is GitHub's own official account.
- `checkout` → the repository name. You can literally visit
  [github.com/actions/checkout](https://github.com/actions/checkout) and read its code.
- `v7` → which version you want.

---

## Why you need it

Delete the `uses: actions/checkout@v7` line from the workflow and push. Your `ls`
step would print… nothing. Empty computer, no files.

With that line, `ls` prints your project:

```
01-hello-world
02-workflow-events
03-workflow-runners
04-using-actions
README.md
```

That's the whole point. And it matters for what the comments in the workflow say
you want to do next:

```yaml
# 1. Install deps of our react application
# 2. Execute automated tests
```

You can't `npm install` your React app in `04-using-actions/react-app` if the files
aren't there. So checkout has to come first. That's why you'll see it as the first
step in almost every workflow you ever look at.

---

## One thing to check

`v7` might not exist — versions go v1, v2, v3, v4, v5… and as of these notes, v5 was
the newest. If `v7` isn't a real version, GitHub can't download it and the run fails
right away with a red ❌ saying something like:

```
Unable to resolve action actions/checkout@v7
```

Go look at the repo's **Actions** tab on github.com — the answer is sitting right there.

- Green ✅ → `v7` is fine, leave it.
- Red ❌ with that message → change it to `@v5` (or whatever
  [github.com/actions/checkout](https://github.com/actions/checkout) shows as latest)
  and push again.
