return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"andrew-george/telescope-themes",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.load_extension("fzf")
			telescope.load_extension("themes")

			require("telescope").setup({
				defaults = {
					path_display = { "smart", "truncate" },
					prompt_prefix = "   ",
					selection_caret = " ",
					entry_prefix = " ",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						width = 0.8,
						height = 0.8,
					},
					mappings = {
						n = { ["q"] = require("telescope.actions").close },
					},
					extensions = {
						themes = {
							enable_previewer = true,
							enable_live_preview = true,
							persist = {
								enable = true,
								path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
							},
						},
					},
				},
			})

			-- set keymaps
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files in cwd" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent files" })
			vim.keymap.set(
				"n",
				"<leader>fc",
				builtin.grep_string,
				{ desc = "Telescope find string under cursor in cwd" }
			)
			vim.keymap.set(
				"n",
				"<leader>ths",
				"<cmd>Telescope themes<CR>",
				{ noremap = true, silent = true, desc = "Theme Switcher" }
			)
		end,
	},
}

