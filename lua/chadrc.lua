-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gatekeeper",

	hl_override = {
		CursorLine = { bg = "#2e3440" }, -- Brighter current line highlight
		NvimTreeCursorLine = { bg = "#3a4450" }, -- Brighter nvim-tree selection
		-- Comment = { italic = true },
		-- ["@comment"] = { italic = true },
	},

	hl_add = {
		NvimTreeCursorLine = { bg = "#3a4450" }, -- Force override nvim-tree selection
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
