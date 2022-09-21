local plugins = {
  -- Plugin manager
  ['wbthomason/packer.nvim'] = {},

  -- Optimiser
  ['lewis6991/impatient.nvim'] = {},

	-- Lua functions
  ['nvim-lua/plenary.nvim'] = {},

	-- Colorscheme - Rose Pine
  ['rose-pine/neovim'] = {
    as = 'rose-pine',
    tag = 'v1.*',
    config = function() require "nik.configs.rose-pine" end,
  },

	-- Colorscheme - Kanagawa
  ['rebelot/kanagawa.nvim'] = {
    as = 'kanagawa',
    config = function() require "nik.configs.kanagawa" end,
  },

  -- Git integration
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function() require "nik.configs.gitsigns" end,
  },

  -- Indent detection
  ["Darazaki/indent-o-matic"] = {
    event = "BufReadPost",
    config = function() require "nik.configs.indent-o-matic" end,
  },

  -- Indentation
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function() require "nik.configs.indent-blankline" end,
  },

  -- Cursorhold fix
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function() vim.g.cursorhold_updatetime = 100 end,
  },

  -- Smarter Splits
  ["mrjones2014/smart-splits.nvim"] = {
    module = "smart-splits",
    config = function() require "nik.configs.smart-splits" end,
  },

  -- Better buffer closing
  ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    config = function() require "nik.configs.icons" end,
  },

  -- Bufferline
  ["akinsho/bufferline.nvim"] = {
    event = "UIEnter",
    config = function() require "nik.configs.bufferline" end,
  },

  -- Statusline
  ["rebelot/heirline.nvim"] = {
    config = function() require "nik.configs.heirline" end,
  },

  -- File explorer
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
    setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function() require "nik.configs.neo-tree" end,
  },

  -- Fuzzy finder
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function() require "nik.configs.telescope" end,
  },

  -- Parenthesis highlighting
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  -- Autoclose tags
  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

  -- Context based commenting
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  -- Commenting
  ['numToStr/Comment.nvim'] = {
    module = { 'Comment', 'Comment.api' },
    config = function() require 'nik.configs.comment' end,
  },

  -- Syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function() require "nik.configs.treesitter" end,
  },

  -- Terminal
  ["akinsho/toggleterm.nvim"] = {
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function() require "nik.configs.toggleterm" end,
  },

  -- LSP & Snippets-----------------------------------------------------

  -- Snippet collection
  ["rafamadriz/friendly-snippets"] = { opt = true },

  -- Snippet engine
  ["L3MON4D3/LuaSnip"] = {
    module = "luasnip",
    wants = "friendly-snippets",
    config = function() require "nik.configs.luasnip" end,
  },

  -- Completion engine
  ["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    config = function() require "nik.configs.cmp" end,
  },

  -- Snippet completion source
  ["saadparwaiz1/cmp_luasnip"] = {
    after = "nvim-cmp",
  },

  -- Buffer completion source
  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
  },

  -- Path completion source
  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
  },

  -- LSP completion source
  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "nvim-cmp",
  },

  -- Package Manager
  ["williamboman/mason.nvim"] = { config = function() require "nik.configs.mason" end },

  ["WhoIsSethDaniel/mason-tool-installer.nvim"] = {
    after = "mason.nvim",
    config = function() require "nik.configs.mason-tool-installer" end,
  },

  -- Built-in LSP
  ["neovim/nvim-lspconfig"] = {},

  -- LSP manager
  ["williamboman/mason-lspconfig.nvim"] = {
    after = { "mason.nvim", "nvim-lspconfig" },
    config = function() require "nik.configs.language-servers" end,
  },

  -- LSP Icons
  ["onsails/lspkind.nvim"] = {
    module = "lspkind",
    config = function() require "nik.configs.lspkind" end,
  },

  -- Autopairs
  ["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = function() require "nik.configs.autopairs" end,
  },
}

local stdpath = vim.fn.stdpath
local packer_available, packer = pcall(require, 'packer')

if packer_available then
  packer.startup {
    function(use)
      for key, plugin in pairs(plugins) do
        if type(key) == 'string' and not plugin[1] then plugin[1] = key end
        use(plugin)
      end
    end,
    config = {
      compile_path = stdpath 'data' .. '/packer_compiled.lua',
      display = {
        open_fn = function() return require('packer.util').float { border = 'single' } end,
      },
      profile = {
        enable = true,
        threshold = 0.0001,
      },
      git = {
        clone_timeout = 300,
        subcommands = {
          update = 'pull --rebase',
        },
      },
      auto_clean = true,
      compile_on_sync = true,
    },
  }
end
