return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- require("neo-tree").setup({
		-- 	filesystem = {
		-- 		follow_current_file = true, -- Automatically focus on the current file
		-- 		hijack_netrw_behavior = "open_current", -- Ensures better behavior with `reveal`
		-- 	},
		-- })

		-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle left<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", {})
	end,
}
