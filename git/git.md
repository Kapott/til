# Git

## Git aliases

For usage in the ~/.gitconfig under the `[aliases]` section.

### Show today's work for current branch
    today = log --pretty=format:"[%h] %s [%cn]" --since="yesterday"

### Commits without colors, for piping
    lnc = log --pretty=format:"%h %s [%cn]"

### Miscellanious aliases
   cp = cherry-pick
   ci = commit
   co = checkout
   br = branch
   diff = diff --word-diff
   dc = diff --cached

   r = reset
   rh = reset --hard
   r1 = reset HEAD^
   r2 = reset HEAD^^

   sl = stash list
   sa = stash apply
   ss = stas save

## Git flow

### Features
* branch off from: `develop`
* must merge back into: `develop`
* branch naming: `feature/*`

#### Create new feature from development
    git checkout -b feature/myfeature develop

#### Create remote branch tracking current/new branch
    git push -u origin feature/myfeature

#### Merge finished feature into development

    git checkout develop
    git merge --no-ff feature/myfeature
    git branch -d feature/myfeature
    git push origin develop

Remember to delete the remote branch when it's truly done.

### Releases

* branch off from: `develop`
* must merge back into: `develop` and `master`
* branch naming: `release/*`

### Create release branch

    git checkout -b release/1.2 develop
    ./bump-version.sh 1.2
    git commit -a -m "Bumped version number to 1.2"

### Finish a release branch
    git checkout master
    git merge --no-ff release/1.2
    git tag -a 1.2

Now, master is up to par with release 1.2. Merge this release back into develop.
    git checkout develop
    git merge --no-ff release/1.2
May lead to conflict. Fix and commit conflict. Then remove release branch.
    git branch -d release/1.2

### Hotfixes

* branch off from: `master`
* must merge back into: `develop` and `master`
* branch naming: `hotfix/*`

#### Create new hotfix

    git checkout -b hotfix/1.2.1 master
    ./bump-version.sh 1.2.1
    git commit -a -m "Bumped version number to 1.2.1"

Fix the production problem and commit the fix.

    git commit -m "Fixed severe production problem"

#### Finish a hotfix branch

First, we merge the fix into master.

    git checkout master
    git merge --no-ff hotfix/1.2.1
    git tag -a 1.2.1

Then, we merge the changes back into develop.

    git checkout develop
    git merge --no-ff hotfix/1.2.1

Finally, we delete the branch.

    git branch -d hotfix/1.2.1

