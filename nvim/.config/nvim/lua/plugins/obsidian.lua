return {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = 'Notes',
                path = vim.fn.expand '~/Dropbox/Notes',
                overrides = {
                    notes_subdir = 'notes',
                },
            },
        },
        note_id_func = function(title)
            return title and title:gsub(" ", "-"):lower() or tostring(os.time())
        end,
        notes_subdir = 'notes',
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = 'notes/dailies',
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = '%Y-%m-%d',
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = '%B %-d, %Y',
            -- Optional, default tags to add to each new daily note created.
            default_tags = { 'daily-notes' },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = "daily_template.md",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        templates = {
            folder = 'templates',
            date_format = '%Y-%m-%d',
            time_format = '%H:%M',
        },
        new_notes_location = 'notes_subdir',
    },
}
