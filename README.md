# Vim-flake8

This is a vim plugin that allow to run flake8 (static syntax and style checker for python) on the current file or directory.

## Install :

First, you need to install [flake8](http://flake8.pycqa.org/en/latest/index.html).

Install with [pathogen](https://github.com/tpope/vim-pathogen).

```shell
git clone https://github.com/manslaughter03/vim-flake8 ~/.vim/bundle/vim-flake8
```

Install with packs vim 8 [help](http://vimhelp.appspot.com/repeat.txt.html#packages).

```shell
git clone https://github.com/manslaughter03/vim-flake8  ~/.vim/pack/plugins/start/vim-flake8
```

## Example of usage :

- Flake8 on the current file

```vim
:Flake8 %
```
