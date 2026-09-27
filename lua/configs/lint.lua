local lint = require "lint"

lint.linters_by_ft = {
  go = { "golangcilint" },

  python = { "ruff" },

  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },

  bash = { "shellcheck" },
  sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd(
  { "BufReadPost", "BufWritePost", "InsertLeave" },
  {
    callback = function()
      lint.try_lint()
    end,
  }
)
