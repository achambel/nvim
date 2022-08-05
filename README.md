# Neovim - My customisations

This repo should work fine with Neovim 0.7, also all packages are pinned so it should remain stable.

## Try out this config

Make sure to remove or move your current `nvim` directory

For a clean installation you might want execute the following before the installation.

```
rm -rf ~/.config/nvim ~/.local/{share,state}/nvim ~/.cache/nvim
```

```
git clone https://github.com/achambel/nvim ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

```
npm i -g neovim
```

- Prettier support - null-ls will use it to format your html, css, js, ts files

  ```
  npm i -g prettier
  ```

- LazyGit support for a lazy git experience

  ```
  brew install lazygit
  ```

---

A big thanks to @chrisatmachine. https://github.com/LunarVim

> The computing scientist's main challenge is not to get confused by the complexities of his own making.

\- Edsger W. Dijkstra
