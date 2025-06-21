-- set default vim leader key

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Open yesterday note
vim.keymap.set("n", "<leader>ny", function()
    vim.cmd("ObsidianYesterday")
end, { desc = "Obsidian: Open Yesterday's Daily Note" })

-- Open today's note
vim.keymap.set("n", "<leader>nd", function()
    vim.cmd("ObsidianToday")
end, { desc = "Obsidian: Open Daily Note" })

-- Open tomorrow's note
vim.keymap.set("n", "<leader>nt", function()
    vim.cmd("ObsidianTomorrow")
end, { desc = "Obsidian: Open Tomorrow's Daily Note" })

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
