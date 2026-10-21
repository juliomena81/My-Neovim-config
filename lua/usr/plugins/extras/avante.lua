return {
  "yetone/avante.nvim",
  build = "make",
  cmd = { "AvanteAsk", "AvanteChat", "AvanteEdit", "AvanteToggle", "AvanteModels" },
  keys = {
    { "<leader>cq", "<cmd>AvanteAsk<cr>", desc = "Avante: Preguntar" },
    { "<leader>ce", "<cmd>AvanteEdit<cr>", mode = "v", desc = "Avante: Editar selección" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-neo-tree/neo-tree.nvim",
    "folke/snacks.nvim",
  },
  opts = {
    provider = "deepseek",
    providers = {
      deepseek = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-chat",
        api_key_name = "cmd:secret-tool lookup service deepseek_api_key",
        extra_request_body = {
          temperature = 0.3,
          max_tokens = 4096,
          top_p = 0.9,
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_apply_diff_after_generation = false,
      auto_set_keymaps = false,
    },
    input = { provider = "snacks" },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function(args)
        vim.keymap.set("n", "<leader>cf", function()
          require("lazy").load({ plugins = { "avante.nvim" } })
          local ok, manager = pcall(require, "neo-tree.sources.manager")
          if not ok then
            return
          end
          local state = manager.get_state("filesystem")
          local node = state and state.tree and state.tree:get_node()
          if node and node.type == "file" then
            require("avante.api").add_selected_file(node.path)
          end
        end, { buffer = args.buf, desc = "Avante: Añadir archivo al chat" })
      end,
    })
  end,
}
