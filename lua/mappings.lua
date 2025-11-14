require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Code Actions (like IntelliJ's Option+Enter) with Telescope picker via dressing.nvim
map("n", "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Show full diagnostic in floating window
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show Diagnostic" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
