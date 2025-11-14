return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    config = function()
      require("conform").setup(require "configs.conform")
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "nvim-mini/mini.nvim", version = "*" },

  {
    "apple/pkl-neovim",
    lazy = true,
    event = { "BufReadPre *.pkl", "BufNewFile *.pkl" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "pkl",
    init = function()
      vim.g.pkl_neovim = {
        start_command = { "pkl-lsp" },
      }
    end,
  },

  {
    "nat-418/boole.nvim",
    event = "VeryLazy",
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
    },
  },

  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    keys = {
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope: Text Case" },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      heading = {
        enabled = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        enabled = true,
        sign = true,
        style = "full",
        position = "left",
        width = "block",
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },
    },
    keys = {
      { "<leader>md", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle Markdown Rendering" },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
        },
      },
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPre",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"
      require("rainbow-delimiters.setup").setup {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    {
      "okuuva/auto-save.nvim",
      cmd = "ASToggle",
      event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
      opts = {
        -- your config goes here
        -- or just leave it empty :)
      },
    },

    {
      "MagicDuck/grug-far.nvim",
      cmd = { "GrugFar" },

      keys = {
        {
          "<leader>fr",
          "<cmd>GrugFar astgrep<cr>",
        },
      },
    },

    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup {}
      end,
    },

    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("nvim-autopairs").setup {
          check_ts = true,
          ts_config = {
            lua = { "string" },
            javascript = { "template_string" },
          },
        }
      end,
    },

    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {},
    },

    {
      "Bekaboo/dropbar.nvim",
      event = "BufReadPost",
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
      },
    },

    {
      "rmagatti/auto-session",
      lazy = false,
      config = function()
        require("auto-session").setup {
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "/tmp" },
          auto_session_use_git_branch = false,
          auto_save_enabled = true,
          auto_restore_enabled = true,
          auto_session_enable_last_session = false,
          -- Save session even on force quit
          session_lens = {
            buftypes_to_ignore = {},
            load_on_setup = true,
            theme_conf = { border = true },
            previewer = false,
          },
          -- Pre-save hook to ensure everything is saved
          pre_save_cmds = {
            function()
              -- Close nvim-tree before saving session
              local tree_api = require("nvim-tree.api")
              if tree_api.tree.is_visible() then
                tree_api.tree.close()
              end
            end,
          },
          -- Post-restore hook to open nvim-tree after restoring
          post_restore_cmds = {
            function()
              -- Delay opening to let session restore complete
              vim.defer_fn(function()
                require("nvim-tree.api").tree.open()
              end, 100)
            end,
          },
        }
      end,
      keys = {
        { "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore Session" },
        { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save Session" },
        { "<leader>sd", "<cmd>SessionDelete<cr>", desc = "Delete Session" },
      },
    },

    {
      "rcarriga/nvim-notify",
      event = "VeryLazy",
      config = function()
        require("notify").setup {
          stages = "fade",
          timeout = 3000,
          background_colour = "#000000",
        }
        vim.notify = require "notify"
      end,
    },

    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = "BufReadPost",
      opts = {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
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
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      event = "BufReadPost",
      opts = {
        signs = true,
        sign_priority = 8,
        keywords = {
          FIX = { icon = "󰃤 ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = "󰄱 ", color = "info" },
          HACK = { icon = "󰈸 ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
        },
        merge_keywords = true,
        -- Make colon optional - matches "TODO something" or "TODO: something"
        highlight = {
          multiline = false,
          before = "",
          keyword = "wide",
          after = "fg",
          pattern = [[.*<(KEYWORDS)\s*:?\s*]],
          comments_only = true,
          max_line_len = 400,
          exclude = {},
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          pattern = [[\b(KEYWORDS):?\s*]],
        },
      },
      keys = {
        { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todos" },
      },
    },

    {
      "NvChad/nvim-colorizer.lua",
      ft = { "css", "scss", "sass", "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
      opts = {
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
        },
      },
    },

    {
      "petertriho/nvim-scrollbar",
      event = "BufReadPost",
      dependencies = { "lewis6991/gitsigns.nvim" },
      config = function()
        require("scrollbar").setup {
          handle = {
            color = "#3e4451",
          },
          marks = {
            Search = { color = "#ff9e64" },
            Error = { color = "#db4b4b" },
            Warn = { color = "#e0af68" },
            Info = { color = "#0db9d7" },
            Hint = { color = "#1abc9c" },
            Misc = { color = "#9d7cd8" },
            GitAdd = { color = "#266d6a" },
            GitChange = { color = "#536c9e" },
            GitDelete = { color = "#b2555b" },
          },
        }
        require("scrollbar.handlers.gitsigns").setup()
      end,
    },

    {
      "j-hui/fidget.nvim",
      event = "LspAttach",
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },

    {
      "andymass/vim-matchup",
      event = "BufReadPost",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },

    {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "xml" },
      config = function()
        require("nvim-ts-autotag").setup {
          opts = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = false,
          },
        }
      end,
    },

    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufReadPost",
      config = function()
        vim.g.skip_ts_context_commentstring_module = true
        require("ts_context_commentstring").setup {
          enable_autocmd = false,
        }
      end,
    },

    {
      "pmizio/typescript-tools.nvim",
      ft = { "typescript", "typescriptreact" },
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {
        settings = {
          expose_as_code_action = "all",
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
      keys = {
        { "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
        { "<leader>ts", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
        { "<leader>tu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
        { "<leader>ti", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
        { "<leader>tf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
        { "<leader>tr", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
      },
    },

    {
      "vuki656/package-info.nvim",
      ft = "json",
      dependencies = { "MunifTanjim/nui.nvim" },
      opts = {},
      keys = {
        { "<leader>ns", "<cmd>lua require('package-info').show()<cr>", desc = "Show Package Info" },
        { "<leader>nu", "<cmd>lua require('package-info').update()<cr>", desc = "Update Package" },
        { "<leader>nd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete Package" },
        { "<leader>ni", "<cmd>lua require('package-info').install()<cr>", desc = "Install Package" },
        { "<leader>nc", "<cmd>lua require('package-info').change_version()<cr>", desc = "Change Version" },
      },
    },

    {
      "ThePrimeagen/refactoring.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
      keys = {
        {
          "<leader>re",
          function()
            require("refactoring").refactor "Extract Function"
          end,
          mode = "x",
          desc = "Extract Function",
        },
        {
          "<leader>rf",
          function()
            require("refactoring").refactor "Extract Function To File"
          end,
          mode = "x",
          desc = "Extract Function To File",
        },
        {
          "<leader>rv",
          function()
            require("refactoring").refactor "Extract Variable"
          end,
          mode = "x",
          desc = "Extract Variable",
        },
        {
          "<leader>ri",
          function()
            require("refactoring").refactor "Inline Variable"
          end,
          mode = { "n", "x" },
          desc = "Inline Variable",
        },
      },
      opts = {},
    },

    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "BufReadPost",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
      "diogo464/kubernetes.nvim",
      ft = { "yaml" },
      dependencies = { "nvim-telescope/telescope.nvim" },
      opts = {},
    },

    {
      "Ramilito/kubectl.nvim",
      config = function()
        require("kubectl").setup()
      end,
      keys = {
        { "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', desc = "Kubectl Toggle" },
      },
    },

    {
      "mfussenegger/nvim-lint",
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        local lint = require("lint")

        -- Define custom kubeconform linter
        lint.linters.kubeconform = {
          cmd = "kubeconform",
          stdin = true,
          args = {
            "-output", "json",
            "-schema-location", "default",
            "-schema-location", "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json",
            "-",
          },
          stream = "stdout",
          ignore_exitcode = true,
          parser = function(output, bufnr)
            local diagnostics = {}

            if not output or output == "" then
              return diagnostics
            end

            -- Try to decode JSON
            local ok, decoded = pcall(vim.json.decode, output)
            if not ok then
              return diagnostics
            end

            -- Handle kubeconform JSON output format
            if not decoded.resources then
              return diagnostics
            end

            for _, resource in ipairs(decoded.resources) do
              if resource.status == "statusInvalid" and resource.validationErrors then
                -- Get buffer lines for line number detection
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

                for _, error in ipairs(resource.validationErrors) do
                  -- Parse path: /spec/egress/0/toPorts/0/ports/0/port
                  local path_parts = vim.split(error.path, "/", { plain = true, trimempty = true })
                  local search_key = path_parts[#path_parts]

                  local lnum = 0
                  local col = 0

                  -- Find the line with this key
                  for i, line in ipairs(lines) do
                    if line:match("^%s*" .. vim.pesc(search_key) .. "%s*:") then
                      lnum = i - 1 -- 0-indexed
                      col = (line:find(search_key) or 1) - 1
                      break
                    end
                  end

                  table.insert(diagnostics, {
                    lnum = lnum,
                    col = col,
                    end_lnum = lnum,
                    end_col = col + #search_key,
                    message = error.msg,
                    severity = vim.diagnostic.severity.ERROR,
                    source = "kubeconform",
                  })
                end
              elseif resource.status == "statusError" then
                -- Schema not found or other errors
                table.insert(diagnostics, {
                  lnum = 0,
                  col = 0,
                  message = resource.msg or "Validation error",
                  severity = vim.diagnostic.severity.WARN,
                  source = "kubeconform",
                })
              end
            end

            return diagnostics
          end,
        }

        -- Set up linters by filetype
        lint.linters_by_ft = {
          yaml = { "kubeconform" },
        }

        -- Auto-lint on save and text change
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "TextChanged", "InsertLeave" }, {
          callback = function()
            -- Only run on YAML files
            if vim.bo.filetype == "yaml" then
              require("lint").try_lint()
            end
          end,
        })

        -- Manual lint command for debugging
        vim.api.nvim_create_user_command("Lint", function()
          require("lint").try_lint()
        end, {})
      end,
    },

    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
      opts = {
        input = {
          enabled = true,
          default_prompt = "Input:",
          border = "rounded",
          relative = "cursor",
          prefer_width = 40,
          win_options = {
            winblend = 0,
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin" },
          telescope = require("telescope.themes").get_dropdown({
            layout_config = {
              width = 0.8,
              height = 0.6,
            },
          }),
        },
      },
    },
  },
  -- Enable blink.cmp for better completion
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
}
