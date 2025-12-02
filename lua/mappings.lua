require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Toggle nvim-tree with §
map("n", "§", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- Find current file in nvim-tree
map("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>", { desc = "Find File in Tree" })

-- Theme picker
map("n", "<leader>ct", "<cmd>lua require('nvchad.themes').open()<CR>", { desc = "Change Theme" })

-- Code Actions (like IntelliJ's Option+Enter) with Telescope picker via dressing.nvim
map("n", "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Show full diagnostic in floating window
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show Diagnostic" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move lines up/down (like IntelliJ's Option+Shift+Up/Down)
map("n", "<M-S-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<M-S-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<M-S-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<M-S-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<M-S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<M-S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
