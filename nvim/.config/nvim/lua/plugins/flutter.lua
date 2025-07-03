-- Dart and Flutter configuration for Neovim with Lazy.nvim

return {
    -- Dart-specific plugin for syntax and basic functionality
    {
        "dart-lang/dart-vim-plugin",
        ft = { "dart" },                    -- Load only for Dart files
        config = function()
            vim.g.dart_style_on_save = 1    -- Auto-format on save
            vim.g.dart_enable_highlight = 1 -- Enable syntax highlighting
        end,
    },

    -- Flutter tools for enhanced Flutter development
    {
        "akinsho/flutter-tools.nvim",
        ft = { "dart" },              -- Load only for Dart files
        dependencies = {
            "nvim-lua/plenary.nvim",  -- Required dependency for flutter-tools
            "stevearc/dressing.nvim", -- Optional for better UI (e.g., flutter run)
        },
        config = function()
            require("flutter-tools").setup {
                -- LSP configuration for dartls
                lsp = {
                    color = { -- Enable Flutter color highlighting
                        enabled = true,
                        background = true,
                        virtual_text = true,
                    },
                    settings = {
                        showTodos = true,             -- Show TODOs in the code
                        completeFunctionCalls = true, -- Autocomplete function calls
                        analysisExcludedFolders = {   -- Exclude folders from analysis
                            vim.fn.expand("$HOME/.pub-cache"),
                            vim.fn.expand("$HOME/fvm/versions"),
                        },
                    },
                },
                -- Debugging support
                debugger = {
                    enabled = true,
                    run_via_dap = true, -- Use nvim-dap for debugging
                    exception_breakpoints = {},
                },
                -- Flutter outline window
                outline = {
                    open_cmd = "35vsplit", -- Open outline in a vertical split
                    auto_open = false,     -- Don't open automatically
                },
                -- Widget guides for Flutter
                widget_guides = {
                    enabled = true,
                },
                -- Closing tags for Flutter
                closing_tags = {
                    enabled = true,
                    prefix = ">",
                },
                -- Dev log configuration
                dev_log = {
                    enabled = true,
                    open_cmd = "tabedit", -- Open log in a new tab
                },
                -- Flutter commands
                fvm = false,                                               -- Use FVM if available
                flutter_path = vim.fn.expand("$HOME/flutter/bin/flutter"), -- Path to Flutter SDK
            }
        end,
    },

    -- LSP configuration for dartls
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.dartls.setup {
                cmd = { "dart", "language-server", "--protocol=lsp" },
                filetypes = { "dart" },
                root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
                init_options = {
                    closingLabels = true,  -- Show closing labels for widgets
                    flutterOutline = true, -- Enable Flutter outline
                    onlyAnalyzeProjectsWithOpenFiles = true,
                    suggestFromUnimportedLibraries = true,
                },
                settings = {
                    dart = {
                        completeFunctionCalls = true,
                        analysisExcludedFolders = {
                            vim.fn.expand("$HOME/.pub-cache"),
                            vim.fn.expand("$HOME/fvm/versions"),
                        },
                    },
                },
            }
        end,
    },

    -- Debugging support with nvim-dap
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",  -- UI for DAP
            "nvim-neotest/nvim-nio", -- Required for dap-ui
        },
        config = function()
            local dap = require("dap")
            dap.configurations.dart = {
                {
                    type = "dart",
                    request = "launch",
                    name = "Launch Flutter",
                    dartSdkPath = vim.fn.expand("$HOME/flutter/bin/dart"),
                    flutterSdkPath = vim.fn.expand("$HOME/flutter/bin/flutter"),
                    program = "${workspaceFolder}/lib/main.dart",
                    cwd = "${workspaceFolder}",
                },
            }
            -- Setup dap-ui
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    -- Optional: Add treesitter for better Dart syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "dart" }, -- Ensure Dart parser is installed
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
}
