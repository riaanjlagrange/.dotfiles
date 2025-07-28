-- function to make nvim background transparent
local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
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
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "tokyonight",
                globalstatus = true,
                disabled_filetypes = { "NvimTree", "neo-tree", "toggleterm" },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = { "nvim-tree" }, -- integrate with nvim-tree window
        },
    }
}
