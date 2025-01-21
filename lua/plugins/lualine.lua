return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin",
				component_separators = '',
    		section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
				lualine_b = { 'filename', 'branch' },
				lualine_c = {},
				lualine_x = {
					{ "encoding" },
				},
				lualine_y = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					'filetype',
					'progress'
				},
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
		})
	end,
}
