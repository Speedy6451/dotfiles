# dotfiles

my configs for GNU plus Linux plus Mozilla computers

Note that `push.sh` overwrites your system's config files, if you aren't a full disk backuper you can `./pull.sh && git stash && ./push.sh` if you aren't sure that you want to be me.

### Layout

- `synced` - list of tracked files
- `pull.sh` - updates repository from computer
- `push.sh` - updates computer from repository
- `nvimsubtree.sh` - updates my [init.vim](https://github.com/Speedy6451/init.vim) repository
    - `./nvimsubtree.sh pull --squash` - update from github
    - `./nvimsubtree.sh push` - push to github
- `./**` - tracked files
