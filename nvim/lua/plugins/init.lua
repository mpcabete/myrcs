require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "EdenEast/nightfox.nvim"
  
  use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
   }

    use {
            "williamboman/nvim-lsp-installer",
            {
            "neovim/nvim-lspconfig",
            config = function()
                    require("nvim-lsp-installer").setup {}
                    local lspconfig = require("lspconfig")
                    lspconfig.sumneko_lua.setup {}
                end
    }}

end)

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false
  },

  indent = {
      enable = true
  }
}




