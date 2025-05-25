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
  { 'eandrju/cellular-automaton.nvim' },
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
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function()
          require('ufo').detach()
        end,
      })

      vim.opt.foldlevelstart = 99
      require('ufo').setup(opts)
    end,
  },
  { "elihunter173/dirbuf.nvim" },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim", -- Required by diffview
  },
  { "mechatroner/rainbow_csv" },
  {
    "kawre/leetcode.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts =
    {
      ---@type string
      arg = "leetcode.nvim",

      ---@type lc.lang
      lang = "cpp",

      cn = { -- leetcode.cn
        enabled = false, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
      },

      ---@type lc.storage
      storage = {
        home = vim.fn.stdpath("data") .. "/leetcode",
        cache = vim.fn.stdpath("cache") .. "/leetcode",
      },

      ---@type table<string, boolean>
      plugins = {
        non_standalone = false,
      },

      ---@type boolean
      logging = true,

      injector = {}, ---@type table<lc.lang, lc.inject>

      cache = {
        update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
      },

      console = {
        open_on_runcode = true, ---@type boolean

        dir = "row", ---@type lc.direction

        size = { ---@type lc.size
          width = "90%",
          height = "75%",
        },

        result = {
          size = "60%", ---@type lc.size
        },

        testcase = {
          virt_text = true, ---@type boolean

          size = "40%", ---@type lc.size
        },
      },

      description = {
        position = "left", ---@type lc.position

        width = "40%", ---@type lc.size

        show_stats = true, ---@type boolean
      },

      ---@type lc.picker
      picker = { provider = nil },

      hooks = {
        ---@type fun()[]
        ["enter"] = {},

        ---@type fun(question: lc.ui.Question)[]
        ["question_enter"] = {},

        ---@type fun()[]
        ["leave"] = {},
      },

      keys = {
        toggle = { "q" }, ---@type string|string[]
        confirm = { "<CR>" }, ---@type string|string[]

        reset_testcases = "r", ---@type string
        use_testcase = "U", ---@type string
        focus_testcases = "H", ---@type string
        focus_result = "L", ---@type string
      },

      ---@type lc.highlights
      theme = {},

      ---@type boolean
      image_support = false,
    }
    ,
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for better UI elements
    },
    config = function()
      require("flutter-tools").setup({
        lsp = {
          on_attach = require("lvim.lsp").common_on_attach,
          capabilities = require("lvim.lsp").common_capabilities(),
          -- This is where the Dart SDK comes into play
          cmd = { "dart", "language-server", "--protocol=lsp" },
          -- OR if using Flutter's bundled Dart:
          -- cmd = { "flutter", "pub", "global", "run", "dart_language_server" },
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          }
        },
        debugger = { -- enable debugger
          enabled = true,
          run_via_dap = true,
        },
      })
    end,
  },
  { "dart-lang/dart-vim-plugin" }, -- for syntax highlighting

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
-- ~/.config/lvim/config.lua

lvim.builtin.telescope = {
  defaults = {
    layout_strategy = "vertical",
    -- You can add other Telescope defaults here if needed
  },
  -- Other Telescope configurations can go here
}

-- Sair do insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
-- Disable Esc in insert mode (force using jk/kj)
local messages = {
  "Nope! Use 'jk' or 'kj'!",
  "Escape key? How quaint.",
  "You know 'jk' is faster, right?",
  "Muscle memory training in progress...",
  "🚨 No cheating! 🚨",
  -- Mild
  "Oh honey, no. We use `jk` now.",
  "Did you mean `kj`? Because that’s what cool people use.",
  -- Aggressive
  "**NO.** `:help jk`",
  "**ERROR:** Brain-to-finger connection failed. Retry with `kj`.",
  -- Gaslighting
  "Wait… you *do* know `jk` is faster, right?",
  "Fun fact: People who use **Esc** also put milk before cereal.",
  -- Unhinged
  "**A WILD ESCAPE ATTEMPT APPEARS!** …It failed.",
  "**Esc** key? In *this* economy?",
  -- Violent
  "**Esc** key disabled. Cry about it.",
  "**LOL. LMAO, EVEN.**",
  "**Pathetic.**",
}

vim.keymap.set("i", "<Esc>", function()
  vim.cmd("highlight Flash guibg=black")
  vim.cmd("set winhighlight=Normal:Flash")
  vim.defer_fn(function()
    vim.cmd("set winhighlight=Normal:Normal")
  end, 100)    -- Reset after 100ms
  local msg = messages[math.random(#messages)]
  print(msg)   -- Shows in command line
  return ""
end, { noremap = true, expr = true })

vim.opt.relativenumber = true
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 500
lvim.builtin.which_key.mappings["g"] = {
  -- C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
  L = { "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>", "Blame Line (full)" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  -- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff Current File" },
  g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
  j = { "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", "Next Hunk" },
  k = { "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", "Prev Hunk" },
  l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
  name = "Git",
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },

  D = { "<cmd>DiffviewOpen<CR>", "Diff All Changes" },       -- Open diffview
  b = { "<cmd>DiffviewOpen main..HEAD<CR>", "Diff vs Main" }, -- Compare current branch vs main
}
