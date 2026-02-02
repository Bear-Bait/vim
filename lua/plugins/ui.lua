-- UI plugins: file explorer, status line, etc.
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            glyphs = {
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
      })

      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file [E]xplorer" })
      vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "material",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to next git [c]hange" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to previous git [c]hange" })

        map("n", "<leader>hs", gs.stage_hunk, { desc = "Git [h]unk [s]tage" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Git [h]unk [r]eset" })
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Git [h]unk [s]tage" })
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Git [h]unk [r]eset" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Git [h]unk [S]tage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git [h]unk [u]ndo stage" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Git [h]unk [R]eset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Git [h]unk [p]review" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Git [h]unk [b]lame line" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Git [h]unk [d]iff against index" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "Git [h]unk [D]iff against last commit" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle git [b]lame line" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "[T]oggle git [d]eleted" })
      end,
    },
  },
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("which-key").setup()

      require("which-key").add({
        { "<leader>c", group = "[C]ode" },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      })
    end,
  },
}
