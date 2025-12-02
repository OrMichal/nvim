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

#### Arch
```bash
sudo pacman -S Neovim
```

### Plugin manager 
My neovim config uses [Packer.nvim](https://github.com/wbthomason/packer.nvim) for managing its plugins.
You can install it using the command below:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
### Vue-lsp
For VueJs lsp to work you need to first install [coc-volar](https://www.npmjs.com/package/@yaegassy/coc-volar/v/0.7.0) language server by pasting these commands in Neovim commandline:
```nvim
:CocInstall @yaegassy/coc-volar
```
```nvim
:CocInstall @yaegassy/coc-volar-tools
```

## Included Language servers:
Here is a list of lsp servers included in this configuration. Lsp is responsible for autocompletions, registering errors, warnings, go to definition and many other.
-  [Rust](https://rust-analyzer.github.io/)
-  [Lua](https://luals.github.io/)
-  [CSS](https://github.com/microsoft/vscode-css-languageservice)
-  [TailwindCSS](https://www.npmjs.com/package/@tailwindcss/language-server)
-  [HTML](https://github.com/microsoft/vscode-html-languageservice)
-  [Typescript](https://github.com/typescript-language-server/typescript-language-server)
-  [C/C++](https://github.com/clangd/clangd)

### What if I don't see my programming language server?
If you don't see the language server of your desired programming language. You can easily add it in two steps.

#### Step One:
create a language server file inside ```/lsp/yourserver.lua``` with format like this:
```lua
return {
  cmd = { "<command to start your server>" },
  filetypes = { "<here goes list of filetypes your lsp should react to>" }
}
```

#### Step Two:
After setting up your ```/lsp/mylsp.lua``` append its name to ```/lua/orsah/lsp.lua```
```lua
local cmp = require("cmp")

vim.lsp.enable({
  "lua_ls",
  "gopls",
  "clangd",
  "html",
  "cssls",
  "ts_ls",
  "svelte",
  "rust_analyzer",
  "tailwindcss",
  "my-lsp" <-- here goes your lsp name
})

...
```
