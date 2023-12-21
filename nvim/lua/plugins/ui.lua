return {
  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    -- Noice UI Elements
    {
      "folke/noice.nvim",
      opts = function(_, opts)
        table.insert(opts.routes, {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        })

        opts.presets.lsp_doc_border = true
      end,
    },
    -- Notifications
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 10000,
      },
    },
    -- Animations
    {
      "echasnovski/mini.animate",
      event = "VeryLazy",
      opts = function(_, opts)
        opts.scroll = { enable = false }
      end,
    },
    -- Status Line
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = {
        options = {
          theme = "solarized_dark",
        },
      },
    },
    -- Filenames
    {
      "b0o/incline.nvim",
      dependencies = { "craftzdog/solarized-osaka.nvim" },
      event = "BufReadPre",
      priority = 1200,
      config = function()
        local colors = require("solarized-osaka.colors").setup()
        require("incline").setup({
          highlight = {
            groups = {
              InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
              InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
            },
          },
          window = { margin = { vertical = 0, horizontal = 1 } },
          hide = {
            cursorline = true,
          },
          render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
            if vim.bo[props.buf].modified then
              filename = "[+] " .. filename
            end

            local icon, color = require("nvim-web-devicons").get_icon_color(filename)
            return { { icon, guifg = color }, { " " }, { filename } }
          end,
        })
      end,
    },
    -- Zen mode
    {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      opts = {
        plugins = {
          gitsigns = true,
          tmux = true,
          kitty = { enabled = false, font = "+2" },
        },
      },
      keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
  },
}
