# Scripts

Configuration managment for my unix based system

# Installation
Add whichever of the following you want and then run `make init`

## zsh
add the following in `~/.zshrc`
```
source ~/scripts/zsh/source.sh
```

and set your `ZSH_THEME="vladimir"`

## vim
add the following in `~/.vimrc`
```
source ~/scripts/vim/vimrc.vim
```

## git
add the following in `~/.gitconfig`
```
[include]
	path = scripts/git/gitconfig
```

## hyper
add the plugin `vladimir` to your plugins array in `~/.hyper.js`

OR

run `make clearHyperConfig` (WARNING! Will overwrite entire `~/.hyper.js` file)