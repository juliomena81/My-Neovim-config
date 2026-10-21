return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "lua", "python", "bash", "vim", "vimdoc", "query", "markdown", "markdown_inline",
          "json", "yaml", "toml", "html", "css", "javascript", "typescript", "tsx",
          "astro", "svelte", "dockerfile", "gitignore" 
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
          },
        },
      })
    end,
  },
}
