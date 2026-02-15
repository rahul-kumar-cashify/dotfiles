return {
    "nvim-telescope/telescope.nvim",
    lazy = false, -- load at startup so gd/gi/gr work immediately
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        preview_height = 0.5, -- results longer, preview smaller (~equal)
                        preview_cutoff = 1,
                        mirror = true, -- preview at bottom
                    },
                },
                preview = true,
                preview_title = true,
            },
        })

        telescope.load_extension("file_browser")

        local builtin = require("telescope.builtin")
        local ext = telescope.extensions

        -- <leader>F: all Telescope pickers (fuzzy find to open any picker)
        vim.keymap.set("n", "<leader>F", function()
            builtin.builtin({ prompt_title = "Telescope" })
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fe", function()
            ext.file_browser.file_browser({ path = vim.fn.expand("%:p:h"), cwd = vim.fn.getcwd() })
        end, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, { noremap = true, silent = true })

        -- gd/gi/gr = LSP definition/implementation/references (Telescope pickers)
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
        vim.keymap.set("n", "gi", builtin.lsp_implementations, { noremap = true, silent = true })
        vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
        -- fm = methods in current file, fs = symbols in workspace
        vim.keymap.set("n", "<leader>fm", builtin.lsp_document_symbols, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fq", builtin.quickfix, { noremap = true, silent = true })

        -- Commands, keymaps, help
        vim.keymap.set("n", "<leader>fC", builtin.commands, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true })

        -- Git only: <leader>G → menu with all git Telescope pickers
        vim.keymap.set("n", "<leader>G", function()
            vim.ui.select(
                { "Status", "Branches", "Commits", "Stash", "Buffer commits", "Grep" },
                { prompt = "Git:", format_item = function(item) return item end },
                function(choice)
                    if not choice then return end
                    if choice == "Status" then builtin.git_status() end
                    if choice == "Branches" then builtin.git_branches() end
                    if choice == "Commits" then builtin.git_commits() end
                    if choice == "Stash" then builtin.git_stash() end
                    if choice == "Buffer commits" then builtin.git_bcommits() end
                    if choice == "Grep" then builtin.live_grep({ prompt_title = "Git grep" }) end
                end
            )
        end, { noremap = true, silent = true })
    end,
}
