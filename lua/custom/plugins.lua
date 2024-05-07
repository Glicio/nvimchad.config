local plugins ={
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
  "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "typescript-language-server",
        "tailwindcss-language-server",
        "prisma-language-server",
        "emmet-ls",
      }
    }
  },
    {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "mattn/emmet-vim",
    lazy = false,
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "sbdchd/neoformat",
    lazy = false,
    config = function() end,
  },
  {
    "theprimeagen/harpoon",
    lazy = false,
    config = function()
      local mark = require "harpoon.mark"
      local ui = require "harpoon.ui"

      vim.keymap.set("n", "<leader>a", function()
        print "FILE ADDED"
        mark.add_file()
      end)
      vim.keymap.set("n", "<A-1>", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<A-2>", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<A-3>", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<A-4>", function()
        ui.nav_file(4)
      end)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  }
}
return plugins
