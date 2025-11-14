local options = {
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome" },
    yaml = { "prettier" },
    pkl = { "pkl_format" },
    -- Conform will run multiple formatters sequentially
  },
  formatters = {
    pkl_format = {
      command = "pkl",
      args = { "format", "$FILENAME" },
      stdin = false,
    },
  },
}

return options
