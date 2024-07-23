return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<Right>",
                        accept_line = "<Down>",
                        next = "<Up>",
                    }
                }
            })
        end
    }
}
