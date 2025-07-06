# 🔧 Git Cheat Sheet

A comprehensive reference for common Git commands and workflows.

---

## 🚀 **Basic Git Setup**

### Initial Configuration
```bash
# Set your identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Check your settings
git config --list

# Set default branch name
git config --global init.defaultBranch main
```

### Initialize Repository
```bash
# Initialize new repository
git init

# Clone existing repository
git clone https://github.com/username/repository.git
git clone git@github.com:username/repository.git  # SSH
```

---

## 📁 **File Operations**

### Check Status
```bash
# View repository status
git status

# Short status format
git status -s
```

### Adding Files
```bash
# Add specific file
git add filename.txt

# Add all files in current directory
git add .

# Add all files (including deleted)
git add -A

# Add by pattern
git add *.js

# Interactive add
git add -i
```

### Removing Files
```bash
# Remove file from staging area
git reset filename.txt

# Remove file completely
git rm filename.txt

# Remove from tracking but keep locally
git rm --cached filename.txt

# Remove directory
git rm -r directory/
```

---

## 💾 **Commits**

### Creating Commits
```bash
# Commit with message
git commit -m "Your commit message"

# Commit all tracked changes
git commit -am "Your commit message"

# Detailed commit with editor
git commit

# Amend last commit
git commit --amend
git commit --amend -m "New commit message"
```

### Viewing Commits
```bash
# View commit history
git log

# One line per commit
git log --oneline

# Last n commits
git log -n 5

# Show changes in each commit
git log -p

# Show stats
git log --stat

# Pretty format
git log --pretty=format:"%h - %an, %ar : %s"

# Graph view
git log --graph --oneline --all
```

---

## 🌿 **Branching**

### Creating Branches
```bash
# Create new branch
git branch feature-name

# Create and switch to new branch
git checkout -b feature-name

# Create branch from specific commit
git branch feature-name abc1234
```

### Switching Branches
```bash
# Switch to existing branch
git checkout branch-name

# Switch to previous branch
git checkout -

# Create and switch (modern syntax)
git switch -c feature-name

# Switch to existing branch (modern syntax)
git switch branch-name
```

### Managing Branches
```bash
# List all branches
git branch

# List all branches (including remote)
git branch -a

# List remote branches
git branch -r

# Delete branch
git branch -d branch-name

# Force delete branch
git branch -D branch-name

# Rename current branch
git branch -m new-name

# Rename specific branch
git branch -m old-name new-name
```

---

## 🔄 **Merging & Rebasing**

### Merging
```bash
# Merge branch into current branch
git merge feature-branch

# Merge without fast-forward
git merge --no-ff feature-branch

# Abort merge
git merge --abort

# Continue merge after resolving conflicts
git merge --continue
```

### Rebasing
```bash
# Rebase current branch onto main
git rebase main

# Interactive rebase
git rebase -i HEAD~3

# Continue rebase after resolving conflicts
git rebase --continue

# Abort rebase
git rebase --abort

# Skip current commit in rebase
git rebase --skip
```

---

## 🌐 **Remote Operations**

### Remote Repositories
```bash
# List remotes
git remote -v

# Add remote
git remote add origin https://github.com/username/repo.git

# Change remote URL
git remote set-url origin https://github.com/username/repo.git

# Remove remote
git remote remove origin
```

### Fetching & Pulling
```bash
# Fetch from remote
git fetch origin

# Fetch all remotes
git fetch --all

# Pull from remote (fetch + merge)
git pull origin main

# Pull with rebase
git pull --rebase origin main

# Pull all branches
git pull --all
```

### Pushing
```bash
# Push to remote
git push origin main

# Push and set upstream
git push -u origin feature-branch

# Push all branches
git push --all origin

# Push tags
git push --tags

# Force push (dangerous!)
git push --force-with-lease origin main
```

---

## 🏷️ **Tags**

### Creating Tags
```bash
# Create lightweight tag
git tag v1.0.0

# Create annotated tag
git tag -a v1.0.0 -m "Version 1.0.0"

# Tag specific commit
git tag -a v1.0.0 abc1234 -m "Version 1.0.0"
```

### Managing Tags
```bash
# List tags
git tag

# List tags with pattern
git tag -l "v1.*"

# Show tag information
git show v1.0.0

# Delete tag
git tag -d v1.0.0

# Delete remote tag
git push origin --delete v1.0.0
```

---

## 🔍 **Inspecting & Comparing**

### Viewing Changes
```bash
# Show unstaged changes
git diff

# Show staged changes
git diff --staged

# Compare branches
git diff main..feature-branch

# Compare specific files
git diff filename.txt

# Compare commits
git diff abc1234..def5678
```

### Searching
```bash
# Search in files
git grep "search term"

# Search in commit messages
git log --grep="fix"

# Search for file changes
git log -- filename.txt

# Find when line was added/changed
git blame filename.txt
```

---

## ⏪ **Undoing Changes**

### Working Directory
```bash
# Discard changes in working directory
git checkout -- filename.txt

# Discard all changes
git checkout -- .

# Clean untracked files
git clean -f

# Clean untracked files and directories
git clean -fd

# Preview what will be cleaned
git clean -n
```

### Staging Area
```bash
# Unstage file
git reset HEAD filename.txt

# Unstage all files
git reset HEAD

# Reset to specific commit (keep changes)
git reset --soft abc1234

# Reset to specific commit (discard changes)
git reset --hard abc1234
```

### Commits
```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Create new commit that undoes changes
git revert abc1234

# Revert merge commit
git revert -m 1 abc1234
```

---

## 🚨 **Emergency Commands**

### When Things Go Wrong
```bash
# See what you've been doing
git reflog

# Recover lost commit
git checkout abc1234

# Abort current operation
git merge --abort
git rebase --abort
git cherry-pick --abort

# Stash current changes
git stash
git stash push -m "work in progress"

# Apply stashed changes
git stash pop
git stash apply stash@{1}

# List stashes
git stash list

# Drop stash
git stash drop stash@{1}
```

---

## 🔧 **Advanced Operations**

### Cherry-picking
```bash
# Apply specific commit to current branch
git cherry-pick abc1234

# Cherry-pick multiple commits
git cherry-pick abc1234 def5678

# Cherry-pick without committing
git cherry-pick --no-commit abc1234
```

### Stashing
```bash
# Stash current changes
git stash

# Stash with message
git stash push -m "work in progress"

# Stash including untracked files
git stash -u

# Apply and remove stash
git stash pop

# Apply stash without removing
git stash apply

# List all stashes
git stash list

# Show stash contents
git stash show stash@{1}

# Delete specific stash
git stash drop stash@{1}

# Clear all stashes
git stash clear
```

### Submodules
```bash
# Add submodule
git submodule add https://github.com/username/repo.git path/to/submodule

# Initialize submodules
git submodule init

# Update submodules
git submodule update

# Clone with submodules
git clone --recursive https://github.com/username/repo.git

# Update submodules to latest
git submodule update --remote
```

---

## 📊 **Useful Aliases**

Add these to your `~/.gitconfig` file:

```bash
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    ca = commit -am
    lg = log --oneline --graph --all
    ll = log --pretty=format:"%h - %an, %ar : %s"
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = !gitk
    type = cat-file -t
    dump = cat-file -p
    hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
    alias = !git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\\t => \\2/' | sort
```

---

## 🎯 **Common Workflows**

### Feature Branch Workflow
```bash
# 1. Start new feature
git checkout main
git pull origin main
git checkout -b feature/new-feature

# 2. Work on feature
git add .
git commit -m "Add new feature"

# 3. Push feature branch
git push -u origin feature/new-feature

# 4. Create pull request (on GitHub/GitLab)
# 5. After approval, merge and cleanup
git checkout main
git pull origin main
git branch -d feature/new-feature
```

### Hotfix Workflow
```bash
# 1. Create hotfix branch from main
git checkout main
git checkout -b hotfix/urgent-fix

# 2. Make fix
git add .
git commit -m "Fix urgent issue"

# 3. Merge to main
git checkout main
git merge hotfix/urgent-fix
git push origin main

# 4. Clean up
git branch -d hotfix/urgent-fix
```

### Release Workflow
```bash
# 1. Create release branch
git checkout main
git checkout -b release/v1.2.0

# 2. Finalize release
git add .
git commit -m "Prepare release v1.2.0"

# 3. Tag release
git tag -a v1.2.0 -m "Release version 1.2.0"

# 4. Merge and push
git checkout main
git merge release/v1.2.0
git push origin main
git push --tags

# 5. Clean up
git branch -d release/v1.2.0
```

---

## 💡 **Best Practices**

### Commit Messages
```bash
# Good commit message format:
# <type>(<scope>): <subject>
#
# <body>
#
# <footer>

# Examples:
git commit -m "feat(auth): add user authentication"
git commit -m "fix(api): resolve timeout issue"
git commit -m "docs(readme): update installation instructions"
git commit -m "refactor(utils): simplify helper functions"
```

### Branch Naming
```bash
# Good branch names:
feature/user-authentication
bugfix/login-error
hotfix/security-patch
release/v1.2.0
```

### General Tips
- Commit early and often
- Write meaningful commit messages
- Keep commits focused on single changes
- Use branches for features and experiments
- Always pull before pushing
- Review changes before committing
- Use `.gitignore` for unwanted files
- Tag important releases

---

## 🆘 **Getting Help**

```bash
# Get help for any command
git help <command>
git <command> --help

# Quick help
git <command> -h

# List all commands
git help -a
```

---

## 🔗 **Useful Resources**

- **Official Git Documentation**: https://git-scm.com/doc
- **Git Tutorial**: https://git-scm.com/docs/gittutorial
- **Interactive Git Tutorial**: https://learngitbranching.js.org/
- **Git Cheat Sheet (Official)**: https://training.github.com/downloads/github-git-cheat-sheet/
- **Atlassian Git Tutorials**: https://www.atlassian.com/git/tutorials
