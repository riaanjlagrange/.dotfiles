return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    highlight = {
		enable = true,
	    },
	    indent = {
		enable = true,
	    },
	    autotag = {
		enable = true,
	    },
	    ensure_installed = {
		'bash',
		'c',
		'diff',
		'tsx',
		'lua',
		'luadoc',
		'typescript',
		'javascript',
		'php',
		'html',
		'markdown',
		'markdown_inline',
		'query',
		'vim',
		'vimdoc',
		'css',
		'scss',
		'sql',
	    },
	    auto_install = true,
	})
    end
}
