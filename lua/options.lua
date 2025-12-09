require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Disable showing commands in bottom right (reduces flicker)
o.showcmd = false
-- Minimize command line height (only shows when needed)
o.cmdheight = 1

-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    wrap = true,
    max_width = 80,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Command aliases for common typos (capital letter variations)
vim.api.nvim_create_user_command("Q", "q<bang>", { bang = true })
vim.api.nvim_create_user_command("W", "w<bang>", { bang = true })
vim.api.nvim_create_user_command("Wq", "wq<bang>", { bang = true })
vim.api.nvim_create_user_command("WQ", "wq<bang>", { bang = true })
