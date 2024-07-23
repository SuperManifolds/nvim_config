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
                        accept = "<Down>",
                        accept_line = "<Right>",
                        next = "<Up>",
                    }
                }
            })
        end
    }
}
