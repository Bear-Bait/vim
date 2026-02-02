-- Material Theme Configuration (matching Doom Material from Alacritty)
return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "palenight"

      require("material").setup({
        contrast = {
          terminal = true,
          sidebars = true,
          floating_windows = true,
          cursor_line = true,
          non_current_windows = false,
          filetypes = {},
        },
        styles = {
          comments = { italic = true },
          strings = {},
          keywords = { italic = true },
          functions = {},
          variables = {},
          operators = {},
          types = {},
        },
        plugins = {
          "gitsigns",
          "nvim-cmp",
          "nvim-tree",
          "telescope",
          "trouble",
          "which-key",
        },
        disable = {
          colored_cursor = false,
          borders = false,
          background = false,
          term_colors = false,
          eob_lines = false,
        },
        high_visibility = {
          lighter = false,
          darker = false,
        },
        lualine_style = "default",
        async_loading = true,
        custom_colors = function(colors)
          -- Override with exact Doom Material colors from Alacritty
          colors.editor.bg = "#262938"
          colors.editor.fg = "#EEFFFF"
          colors.editor.selection = "#314048"
          colors.editor.cursor = "#EEFFFF"
          colors.syntax.keyword = "#c792ea"
          colors.syntax.string = "#c3e88d"
          colors.syntax.number = "#f78c6c"
          colors.syntax.func = "#82aaff"
          colors.syntax.variable = "#EEFFFF"
          colors.syntax.comment = "#546E7A"
        end,
        custom_highlights = {},
      })

      vim.cmd("colorscheme material")
    end,
  },
}
