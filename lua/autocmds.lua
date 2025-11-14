require "nvchad.autocmds"

-- Auto-open nvim-tree on startup (only if not restoring a session)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- Don't open if opening a file
    local real_file = vim.fn.filereadable(data.file) == 1
    -- Don't open if restoring a session
    local restoring_session = vim.g.auto_session_enabled ~= false

    if not real_file and not restoring_session then
      require("nvim-tree.api").tree.open()
    end
  end,
})

-- Auto-close nvim-tree when it's the last window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Auto-switch between relative and absolute line numbers based on mode
local augroup = vim.api.nvim_create_augroup("NumberToggle", { clear = true })

-- Switch to relative line numbers in Insert and Visual modes
vim.api.nvim_create_autocmd({ "InsertEnter", "ModeChanged" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == "i" or mode == "v" or mode == "V" or mode == "\22" then -- \22 is <C-v> (visual block)
      vim.opt.relativenumber = true
      vim.opt.number = true
    end
  end,
})

-- Switch to absolute line numbers in Normal mode
vim.api.nvim_create_autocmd({ "InsertLeave", "ModeChanged" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == "n" then
      vim.opt.relativenumber = false
      vim.opt.number = true
    end
  end,
})
