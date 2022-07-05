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
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "norcalli/nvim-colorizer.lua"

    -- Colorschemes
    use "lunarvim/darkplus.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Other
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "feline-nvim/feline.nvim"
    use "akinsho/toggleterm.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "goolord/alpha-nvim"
    use "folke/which-key.nvim"

    -- Helper
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
