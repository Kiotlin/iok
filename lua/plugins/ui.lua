return {
  -- Dialog
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = require("lualine.themes.solarized_dark"),
      },
    },
  },

  -- filename
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
            InclineNormalNC = { guibg = colors.base03, guifg = colors.violet500 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return {
            { icon, guifg = color },
            { " " },
            { filename },
          }
        end,
      })
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "BufferLineCycleNext<CR>", desc = "Next Tab" },
      { "<S-Tab>", "BufferLineCyclePrev<CR>", desc = "Previous Tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icons = false,
      },
    },
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = require("lualine.themes.solarized_dark"),
      },
    },
  },

  -- animation
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- Dashboard
  {
    {
      "goolord/alpha-nvim",
      event = "VimEnter",
      enabled = true,
      init = false,
      opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local header = {
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣀⣀⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⣿⣿⣿⣿⣿⢟⢍⣼⣿⣿⣿⣿⣿⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⣿⣿⣿⢟⣵⢏⣾⣿⣿⣿⣷⣿⣟⣤⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⣿⣿⣫⡿⠋⠀⢻⣿⣿⣿⡿⠿⢸⠏⠠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⣿⢣⠟⠀⠀⠀⠀⠙⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⣿⣿⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⠀⠀⠀⠀",
          "⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⣸⣧⠀⠀⠀⠀",
          "⣿⠻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⠈⠉⠑⠀⠀⢀⠀⠀⠀⡄⢩⣿⣧⡀⣖⢋",
          "⣿⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡦⡜⣤⢸⣦⣸⣦⡀⠀⢸⡆⠀⡀⠀⢈⠀",
          "⣿⣿⠁⠀⠀⣴⡆⠀⠀⠀⠀⢀⠀⣻⣿⣿⣽⣿⣿⣿⣿⣿⣷⣾⣧⢦⣵⣄⣿⠀",
          "⣿⣿⡄⣰⣬⣿⣇⠀⠀⠀⠀⢸⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀",
          "⣯⣝⣷⣿⡿⢻⣿⡄⠀⠀⢸⣦⠀⠀⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀",
          "⣿⣿⢯⣶⣿⣿⣿⣿⣦⣀⠘⢿⢨⡆⡜⣶⡝⠿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⣀⣠",
          "⣽⣯⣾⣿⣿⣿⡿⠛⠿⠿⠿⠒⠻⠓⢚⢘⣴⣿⡬⣝⣛⣻⣽⣶⣏⡄⢸⣿⠋⡟",
        }

        -- Obtain Date Info
        local date = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
        local date_info = "󰨲 Today is " .. date:read("*a")
        date:close()
        local date_today = {
          type = "text",
          val = date_info,
          opts = {
            position = "center",
            hl = "Keyword",
          },
        }

        dashboard.section.header.val = header
        -- stylua: ignore
        dashboard.section.buttons.val = {
          dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
          dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
          dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
          dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
          dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
          dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
          dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
          button.opts.hl = "AlphaButtons"
          button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout = {
          { type = "padding", val = 2 },
          dashboard.section.header,
          { type = "padding", val = 2 },
          date_today,
          { type = "padding", val = 2 },
          dashboard.section.buttons,
          dashboard.section.footer,
        }
        dashboard.opts.layout[1].val = 8
        return dashboard
      end,
      config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
          vim.cmd.close()
          vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "AlphaReady",
            callback = function()
              require("lazy").show()
            end,
          })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "LazyVimStarted",
          callback = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = "⚡ Neovim loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
      end,
    },
  },
}
