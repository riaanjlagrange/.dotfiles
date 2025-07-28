return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 20,                -- height of the floating window
            open_mapping = [[<C-\>]], -- Ctrl + backslash to toggle
            direction = "float",      -- floating terminal
            float_opts = {
                border = "single",
                width = 80,
                height = 20,
                winblend = 0,     -- no transparency, change if you want
            },
            close_on_exit = true, -- auto close terminal when process exits
            auto_scroll = true,
        }
    end
}
