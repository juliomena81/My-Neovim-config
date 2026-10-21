return {
  -- Colores hex y rgb (fork mantenido de norcalli/nvim-colorizer)
  {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          names = true,
          rgb_fn = true,
        },
      })
    end,
  },
}
