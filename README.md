# nick's dotfiles

this repository contains (hopefully) updated configuration files for my daily driver workstations.

## setup and what not

there are branches for each workstation i use, and then this branch for the readme.

### checking out branches for use

checking out each of these branches for use does require some setup work;
the way *I* plan to use this repo is as follows:

clone the **bare repo** into the home directory of the user:
```
$ git clone --bare git@github.com:bicknrown/dotfiles.git $HOME/.dotfiles
```
in the current shell scope, set the alias for the bare repository (while not strictly necessary, it makes it less likely for me to mess something up):
```
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
checkout the specifc branch in question[^1] (the latter option not using an alias):
```
$ dotfiles checkout <branch>
```
or
```
$ git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout <branch>
```
set the configuration of the repository to not show untracked files (again, not strictly necessary, but it makes things was cleaner to work with.):
```
$ dotfiles config --local status.showUntrackedFiles no
```
or
```
$ git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
```

### setup for a new workstation on a new branch

create a new bare git repository:
```
$ git init --bare $HOME/.dotfiles
```
create the alias for working with the new bare repository:
```
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
set the repo configuration to not show untracked files:
```
$ dotfiles config --local status.showUntrackedFiles no
```
checkout the new branch:
```
$ dotfiles -b <new branch name>
```
add remote for new branch to be pushed:
```
$ dotfiles remote add <remote name> git@github.com:bicknrown/dotfiles.git 
```
add files to be tracked:
```
$ dotfiles add <file>
```
commit the added/changed files:
```
$ dotfiles commit
```
push the commit(s) to the remote:
```
$ dotfiles push <remote name> <new branch name>
```

[^1]: this might fail depending on whether there are files git would have to overwrite; in that case, backup or remove those files, and try again.


