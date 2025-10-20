return {
    "ojroques/nvim-osc52",
    lazy = true,
    config = function()
        require("osc52").setup {
            max_length = 0, -- no limit
            silent = true,
        }

        -- mappings for system clipboard
        vim.keymap.set('v', '<leader>y', function() require('osc52').copy_register('+') end)
        vim.keymap.set('n', '<leader>y', function() require('osc52').copy_register('+') end)
        vim.keymap.set('n', '<leader>p', function() require('osc52').paste() end)
    end
}
