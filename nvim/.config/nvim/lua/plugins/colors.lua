-- function to make nvim background transparent
local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
end

return {
    { -- theme
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
	    vim.cmd.colorscheme "tokyonight"
	    enable_transparency()
	end,
    },
    { -- lualine
	"nvim-lualine/lualine.nvim",
	dependecies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "tokyonight",
	}
    }
}
