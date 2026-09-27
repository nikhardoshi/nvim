local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    go = { "goimports" },

    python = { "ruff_format", "black" },

    c = { "clang_format" },
    cpp = { "clang_format" },

    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },

    bash = { "shfmt" },
    sh = { "shfmt" },
  },
}

return options
