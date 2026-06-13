-- set default vim options
--
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shell = '/bin/zsh'
vim.opt.conceallevel = 1
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10

local osc52 = require('vim.ui.clipboard.osc52')

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        local regtype = vim.v.event.regtype
        local regcontents = vim.v.event.regcontents
        osc52.copy('+')(regcontents, regtype)
    end,
})
