return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      sh = { "shfmt" },
      html = { "prettier" },
      css = { "prettier" },
      astro = { "prettier" },
      svelte = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 3000,
    },
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}