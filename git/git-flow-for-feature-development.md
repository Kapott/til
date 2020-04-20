# Git-flow for feature development

Git-flow is a standard methodology of using git to develop new features. In my career this has been the standard convention at most places:

### Developing features

* branch off from: `develop`
* must merge back into: `develop`
* branch naming: `feature/*` (usually includes some kind of ticket reference)

#### Create new feature from development

```sh
git checkout -b feature/myfeature develop
```

#### Create remote branch tracking current/new branch

```sh
git push -u origin feature/myfeature
```

#### Merge finished feature into development

```sh
git checkout develop
git merge --no-ff feature/myfeature
git branch -d feature/myfeature
git push origin develop
```

Remember to delete the remote branch when it's truly done!

### Deploying releases

* branch off from: `develop`
* must merge back into: `develop` and `master`
* branch naming: `release/*`

### Create release branch

```sh
git checkout -b release/1.2 develop
./bump-version.sh 1.2
git commit -a -m "Bumped version number to 1.2"
```

### Finish a release branch

```sh
git checkout master
git merge --no-ff release/1.2
git tag -a 1.2
```

Now, master is up to par with release 1.2. Merge this release back into develop.

```sh    
git checkout develop
git merge --no-ff release/1.2
```

May lead to conflict. Fix and commit conflict. Then remove release branch.

```sh   
git branch -d release/1.2
```

### Handling hotfixes

* branch off from: `master`
* must merge back into: `develop` and `master`
* branch naming: `hotfix/*`

#### Create new hotfix

```sh
git checkout -b hotfix/1.2.1 master
./bump-version.sh 1.2.1
git commit -a -m "Bumped version number to 1.2.1"
```

Fix the production problem and commit the fix.

```sh
git commit -m "Fixed severe production problem"
```

#### Finish a hotfix branch

First, we merge the fix into master.

```sh
git checkout master
git merge --no-ff hotfix/1.2.1
git tag -a 1.2.1
```

Then, we merge the changes back into develop.

```sh
git checkout develop
git merge --no-ff hotfix/1.2.1
```

Finally, we delete the branch.

```sh
git branch -d hotfix/1.2.1
```

