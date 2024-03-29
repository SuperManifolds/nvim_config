return {
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {
            disable_mouse = false,
            max_count = 3,
             disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {}
            },
            restricted_keys = {
                      ["h"] = { "n", "x" },
                      ["j"] = { "n", "x" },
                      ["k"] = { "n", "x" },
                      ["l"] = { "n", "x" },
                      ["-"] = { "n", "x" },
                      ["+"] = { "n", "x" },
                      ["gj"] = { "n", "x" },
                      ["gk"] = { "n", "x" },
                      ["<CR>"] = { "n", "x" },
                      ["<C-M>"] = { "n", "x" },
                      ["<C-N>"] = { "n", "x" },
                      ["<C-P>"] = { "n", "x" },
                      ["<Up>"] = { "n", "x", "i" },
                      ["<Down>"] = { "n", "x", "i" },
                      ["<Left>"] = { "n", "x", "i" },
                      ["<Right>"] = { "n", "x", "i" },
            }
        }
    }
}
