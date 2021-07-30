local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

local packer = require "packer"
local use = packer.use

local plugins = function()
  -- SYNTAX
  -- Treesitter: Better highlighting
  -- Polyglot: Better indentation
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "_treesitter"
    end,
    event = "BufRead",
    opt = true,
    run = ":TSUpdate"
  }
  use {
    "sheerun/vim-polyglot",
    event = "BufRead",
    opt = true,
  }

  -- LANGUAGE SERVER PROTOCOL
  -- (Intellisense)
  use "neovim/nvim-lspconfig"
  use {
    "kabouzeid/nvim-lspinstall",
    config = function()
      require "_lsp"
    end,
  }

  -- DIAGNOSTICS
  use {
    "glepnir/lspsaga.nvim",
    event = "BufWinEnter",
    requires = {
      "ray-x/lsp_signature.nvim",
    }
  }

  -- AUTOCOMPLETION
  use {
    "hrsh7th/nvim-compe",
    config = function()
      require "_compe"
    end,
    event = "InsertEnter"
  }

  -- AUTOPAIRS
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter"
  }

  -- COLORIZER
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end,
    event = "BufWinEnter"
  }

  -- FILE EXPLORER
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "_nvimtree"
    end,
    requires = {
      "kyazdani42/nvim-web-devicons"
    }
  }

  -- FUZZY FINDER
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "_telescope"
    end,
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim"
    }
  }

  -- INTERFACE
  -- Lualine: Statusline
  -- Barbar: Bufferline
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "_lualine"
    end,
    event = "BufWinEnter"
  }
  use {
    "romgrk/barbar.nvim",
    config = function()
      require "_barbar"
    end,
    event = "BufWinEnter"
  }

  -- TERMINAL
  use {
    "numtostr/FTerm.nvim",
    config = function()
      require "_fterm"
    end
  }

  -- COLORSCHEMES
  -- use "folke/tokyonight.nvim"
  use {
    "projekt0n/github-nvim-theme",
    config = function()
      require "github-theme".setup {
        themeStyle = "dark",
        commentStyle = "NONE",
        keywordStyle = "NONE",
        functionStyle = "NONE",
        variableStyle = "NONE"
      }
    end
  }

  -- UTILS
  use {
    "junegunn/vim-easy-align",
    cmd = "EasyAlign"
  }
  -- use {
  -- "mhartington/formatter.nvim",
  -- config = function()
  -- require "_formatter"
  -- end
  -- }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "gitsigns".setup()
    end,
    event = "BufWinEnter"
  }

  -- PACKER
  use {"wbthomason/packer.nvim", opt = true}
end

packer.startup(plugins)

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
