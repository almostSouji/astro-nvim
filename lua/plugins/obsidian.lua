-- NOTE: https://github.com/obsidian-nvim/obsidian.nvim

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    picker = { name = "snacks.picker" },
    ui = { enable = false },
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian/",
      },
      {
        name = "cysec",
        path = "~/Documents/cysecvault/",
      },
    },
  },
}
