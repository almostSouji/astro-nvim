return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  init = function()
    local function set_vault_hl()
      local hl = vim.api.nvim_set_hl
      local c = {
        peach = "#fab387",
        green = "#a6e3a1",
        sapphire = "#74c7ec",
        overlay0 = "#6c7086",
        red = "#f38ba8",
      }

      hl(0, "VaultTodo", { fg = c.peach, bold = true })
      hl(0, "VaultDone", { fg = c.green, bold = true })
      hl(0, "VaultForwarded", { fg = c.sapphire, bold = true })
      hl(0, "VaultCancelled", { fg = c.overlay0, bold = true })
      hl(0, "VaultUrgent", { fg = c.red, bold = true })

      -- Optional: make obsidian.nvim's UI inside vaults match
      hl(0, "ObsidianTodo", { fg = c.peach, bold = true })
      hl(0, "ObsidianDone", { fg = c.green, bold = true })
      hl(0, "ObsidianRightArrow", { fg = c.sapphire, bold = true })
      hl(0, "ObsidianTilde", { fg = c.overlay0, bold = true })
      hl(0, "ObsidianImportant", { fg = c.red, bold = true })
    end

    set_vault_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("VaultHighlights", { clear = true }),
      callback = set_vault_hl,
    })
  end,
  opts = {
    latex = { enabled = false },
    checkbox = {
      unchecked = { icon = "[ ]", highlight = "VaultTodo" },
      checked = { icon = "[x]", highlight = "VaultDone" },
      custom = {
        forwarded = { raw = "[>]", rendered = "[>]", highlight = "VaultForwarded" },
        cancelled = { raw = "[~]", rendered = "[~]", highlight = "VaultCancelled" },
        urgent = { raw = "[!]", rendered = "[!]", highlight = "VaultUrgent" },
      },
    },
    on = {
      render = function() require("nabla").enable_virt { autogen = true } end,
      clear = function() require("nabla").disable_virt() end,
    },
  },
}
