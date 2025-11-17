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

-- Close nvim-tree before quitting if there are other windows
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local tree_wins = {}
    local floating_wins = {}

    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_wins, w)
      end
    end

    -- If only tree + floating windows remain, close tree windows
    if #wins - #floating_wins - #tree_wins <= 1 then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Auto-close vim when nvim-tree is the last window
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    local wins = vim.api.nvim_list_wins()
    if #wins == 1 then
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(wins[1]))
      if bufname:match "NvimTree_" ~= nil then
        vim.cmd "quit"
      end
    end
  end,
})

-- Force brighter nvim-tree cursor line highlight and visual selection
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme", "FileType" }, {
  pattern = { "*", "NvimTree" },
  callback = function()
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#2B2B40" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#723A3F" })
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
