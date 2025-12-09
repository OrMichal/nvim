return {
  cmd = { "vue-language-server", "--stdio" },  -- installed via npm i -g @vue/language-server
  filetypes = { "vue" },
  root_dir = vim.fs.root(0, { "package.json", "vite.config.js", "vue.config.js" }),
  init_options = {
    typescript = {
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
    }
  }
}

