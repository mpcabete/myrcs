-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.plugins = {
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end
  -- },
  -- { "lunarvim/colorschemes" },
  { "ellisonleao/gruvbox.nvim",     priority = 1000, config = true, opts = ... },
  { "simrat39/symbols-outline.nvim" },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      local path = "~/.local/share/lvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,

  },
  {
  "ggandor/lightspeed.nvim",
  event = "BufRead",
},
{'eandrju/cellular-automaton.nvim' },
{
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_foreground = 'original'
      end
    }

}

lvim.colorscheme = "gruvbox"
-- table.insert(lvim.plugins, {
--   'wfxr/minimap.vim',
--   build = "cargo install --locked code-minimap",
--   init = function()
--     vim.g.minimap_width = 10
--     vim.g.minimap_auto_start = 1
--     vim.g.minimap_auto_start_win_enter = 1
--   end
-- })
---- Default options:

-- require("gruvbox").setup({
--   terminal_colors = true, -- add neovim terminal colors
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = true,
--     emphasis = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = false,
-- })

-- -- vim.cmd("colorscheme gruvbox")

-- require("symbols-outline").setup()

lvim.builtin.dap.active = true
-- In your config.lua file

-- First ensure treesitter is configured
lvim.builtin.treesitter.ensure_installed = {
  "html",
  "javascript",
  "python",
}

-- Enable treesitter highlighting
lvim.builtin.treesitter.highlight.enable = true

vim.filetype.add({
    extension = {
        html = "jinja.html",
        j2 = "jinja",
        jinja = "jinja",
        jinja2 = "jinja",
    },
})
