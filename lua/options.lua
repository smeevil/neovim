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
