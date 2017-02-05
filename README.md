# vim dotfiles

vimrc repository for neovim.

See [Installing Neovim][https://github.com/neovim/neovim/wiki/Installing-Neovim]

# Install
```sh
$ git clone git@github.com:sthysel/vim-config.git 
$ ln -s ${HOME}/.config/nvim vim-config

$ pip install --user -U neovim
$ pip3 install --user -U neovim
```


##  Note
vimrc files used to live in dotfiles repo, I filtered it out into this repo as
ansible and docker are better served from a dedicated vimrc repo.


```
git filter-branch --subdirectory-filter vim -- master
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
git remote add origin git@github.com:sthysel/dotvim.git
```
