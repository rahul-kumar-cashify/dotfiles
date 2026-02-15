return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        { "<leader>ws", "<cmd>AutoSession search<cr>", desc = "Session search" },
        { "<leader>wS", "<cmd>AutoSession save<cr>", desc = "Save session" },
    },
    opts = {
        auto_save = true,
        auto_restore = true,
        auto_create = true,
        log_level = "info",
        show_auto_restore_notif = true,
        -- Don't save/restore in these dirs (avoid clutter)
        suppressed_dirs = { "~/", "~/Downloads", "/" },
        session_lens = {
            load_on_setup = true, -- use :Telescope session-lens
        },
    },
    config = function(_, opts)
        -- Restore buffers, tabs, windows, folds, size, position
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
        require("auto-session").setup(opts)
    end,
}
