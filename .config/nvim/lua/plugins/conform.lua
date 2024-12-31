return {
  "stevearc/conform.nvim",
  event = { "LspAttach", "BufReadPost", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      javascript = {"prettier" },
      typescript = { "prettier" },
      lua = { "stylua" },
    },
    format_on_save = {
      timeout_ms = 25000,
      lsp_fallback = true,
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)
    conform.formatters.prettier = {
      prepend_args = { "--prose-wrap", "always" },
    }
  end,
}
