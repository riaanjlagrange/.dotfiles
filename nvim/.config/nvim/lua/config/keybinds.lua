-- set default vim leader key

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<leader>nd", function()
    vim.cmd("ObsidianToday")
end, { desc = "Obsidian: Open Daily Note" })

vim.keymap.set("n", "<leader>nn", function()
    vim.ui.input({ prompt = "New note title: " }, function(input)
        if input then
            vim.cmd("ObsidianNew " .. input)
        end
    end)
end, { desc = "Obsidian: New Note" })

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    end,
})
