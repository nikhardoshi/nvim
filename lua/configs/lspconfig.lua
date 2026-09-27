require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",
  "gopls",
  "basedpyright",
  "clangd",
  "ts_ls",
  "bashls",
}

vim.lsp.enable(servers)
