# My personal neovim config

## Instalation guide:

### Neovim installation

#### Ubuntu:
```bash
sudo add-apt-repository ppa:neovim-ppa/stable -y
```
```bash
sudo apt install Neovim
```

#### Arch based
```bash
sudo pacman -S Neovim
```

### Plugin manager 
My neovim config uses [Packer.nvim](https://github.com/wbthomason/packer.nvim) for managing its plugins.
You can install it using the command below:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
### Vue-lsp
For VueJs lsp to work you need to first install [coc-volar](https://www.npmjs.com/package/@yaegassy/coc-volar/v/0.7.0) language server by pasting these commands in Neovim commandline:
```nvim
:CocInstall @yaegassy/coc-volar
```
```nvim
:CocInstall @yaegassy/coc-volar-tools
```
