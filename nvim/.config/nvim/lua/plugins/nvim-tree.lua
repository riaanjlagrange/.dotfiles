return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('nvim-tree').setup {
            actions = {
                open_file = {
                    quit_on_open = false, -- Keeps nvim-tree open after opening a file
                },
            },
            view = {
                width = 30,
                side = "left",
                preserve_window_proportions = true,
            },
        }

        -- Toggle tree with \
        vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end
}
