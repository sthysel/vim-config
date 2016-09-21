# vim dotfiles

This is my vimrc repository for neovim.

## Install
```sh
git clone git@github.com:sthysel/dotvim.git dotvim
ln -s .config/nvim dotvim
```

See (Installing Neovim)[https://github.com/neovim/neovim/wiki/Installing-Neovim]


## History
vimrc files used to live in my dotfiles repo, I filtered it out into this repo as ansible and docker are better served
from a dedicated vimrc repo.
```
git filter-branch --subdirectory-filter vim -- master
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
git remote add origin git@github.com:sthysel/dotvim.git
```
