local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
-- Plugins under here
use "wbthomason/packer.nvim"
use "kyazdani42/nvim-tree.lua"
use "windwp/nvim-autopairs"
-- Colorscheme
use 'navarasu/onedark.nvim'
use { "ellisonleao/gruvbox.nvim" }


-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- Treesitter
use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

-- LSP
-- use "neovim/nvim-lspconfig" -- enable LSP
--use "williamboman/nvim-lsp-installer" -- simple to use language server installer
use {
    "williamboman/nvim-lsp-installer",
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvim-lsp-installer").setup {}
            local lspconfig = require("lspconfig")
            lspconfig.sumneko_lua.setup{
                    settings = {
                        Lua = {
                          diagnostics = {
                            globals = { 'vim' },
                          },
                        },
                      },
                on_attach = function ()
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
                end,
            }
            lspconfig.tsserver.setup{
                on_attach = function ()
                    print('tsserver LSP is attached')
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
                    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer= 0})
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
                end,
            }
            lspconfig.html.setup{
                on_attach = function ()
                    print('HTML LSP is attached')
                end,
            }
--            lspconfig.rome.setup{
--                on_attach = function ()
--                   print('Rome is attached')
--                   vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
--                   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
--                end,
--           }
        end
    }
}
use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


-- CMP
use "hrsh7th/nvim-cmp" -- The completion plugin
use "hrsh7th/cmp-buffer" -- buffer completions
use "hrsh7th/cmp-path" -- path completions
use "hrsh7th/cmp-cmdline" -- cmdline completions
use "saadparwaiz1/cmp_luasnip" -- snippet completions
use "hrsh7th/cmp-nvim-lsp"

-- snippets
use "L3MON4D3/LuaSnip" --snippet engine
use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

-- whichkey
-- use "folke/which-key.nvim"
 use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
 }

-- bufferline
-- use "akinsho/bufferline.nvim"
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

-- lualine
use "nvim-lualine/lualine.nvim"

-- indent blackline
use "lukas-reineke/indent-blankline.nvim"

-- comment
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

-- harpoon
use 'ThePrimeagen/harpoon'
use 'nvim-lua/plenary.nvim'

	if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
