---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.theme = {
  n = {
    ["<leader>st"] = {
      function()
        vim.cmd.highlight "Normal guibg=none"
        vim.cmd.highlight "Normal ctermbg=none"
        vim.cmd.highlight "NonText guibg=none"
        vim.cmd.highlight "NonText ctermbg=none"
        vim.cmd.highlight "EndOfBuffer guibg=none"
        vim.cmd.highlight "EndOfBuffer ctermbg=none"
        vim.cmd.highlight "Folded guibg=none"
        vim.cmd.highlight "Folded ctermbg=none"
      end,
      "Toggle Theme",
    },
  },
}

M.format = {
  n = {
    ["<F3>"] = { "<cmd>Neoformat<cr>", "Format Buffer" },
  },
}

M.telescope = {
  n = {
    ["<leader>f"] = {
      function()
        require("telescope.builtin").find_files()
      end,
      "Find Files",
    },
    ["<leader>gf"] = {
      function()
        require("telescope.builtin").git_files()
      end,
      "Find Git Files",
    },
    ["<leader>sh"] = {
      function()
        require("telescope.builtin").help_tags()
      end,
      "Find Help Tags",
    },
    ["<leader>sg"] = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Live Grep",
    },
    ["<leader>sr"] = {
      function()
        require("telescope.builtin").resume()
      end,
      "Resume Last Search",
    },
    ["<leader>jv"] = {
      function()
        local config = {
          cmd = {'jdtls'},
          root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
        }
        require('jdtls').start_or_attach(config)
      end,
      "Resume Last Search",
    },
  },
}

M.navigator = {
  n = {
    ["<C-j>"] = {
      function()
        vim.cmd "TmuxNavigateDown"
      end,
      "Tmux Navigate Down",
    },
    ["<C-k>"] = {
      function()
        vim.cmd "TmuxNavigateUp"
      end,
      "Tmux Navigate Up",
    },
  },
}

return M
