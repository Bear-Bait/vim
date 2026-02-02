-- Treesitter configuration for better syntax highlighting
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- Install parsers
      require("nvim-treesitter").install({
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "toml",
        "rust",
        "go",
      })

      -- Enable highlighting for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Enable treesitter-based folding
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          vim.wo[0][0].foldmethod = "expr"
          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })

      -- Text object keymaps for selection
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end, { desc = "Select outer function" })
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inner function" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end, { desc = "Select outer class" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inner class" })

      -- Text object keymaps for movement
      vim.keymap.set({ "n", "x", "o" }, "]m", function()
        require("nvim-treesitter-textobjects.move").goto_next("@function.outer", "textobjects")
      end, { desc = "Next function start" })
      vim.keymap.set({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next("@class.outer", "textobjects")
      end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "]M", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[m", function()
        require("nvim-treesitter-textobjects.move").goto_prev("@function.outer", "textobjects")
      end, { desc = "Previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_prev("@class.outer", "textobjects")
      end, { desc = "Previous class start" })
      vim.keymap.set({ "n", "x", "o" }, "[M", function()
        require("nvim-treesitter-textobjects.move").goto_prev_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_prev_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })
    end,
  },
}
