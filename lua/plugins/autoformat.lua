-- Autoformat
return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { 'prettier', stop_after_first = true },
        typescript = { 'prettier', stop_after_first = true },
        html = { 'prettier', stop_after_first = true },
        vue = { 'prettier', stop_after_first = true },
        c = { 'clang-format' },
        php = { 'phpcbf', stop_after_first = true },
        java = { 'google-java-format' },
      },
      formatters = {
        phpcbf = {
          command = vim.fn.expand '$CMSDIR' .. 'vendor/bin/phpcbf',
          args = {
            '--standard=' .. vim.fn.expand '$CMSDIR' .. 'assets/codestyle/ruleset.xml',
            '$FILENAME',
            '--ignore=vendor/*,node_modules/*,plugins/*,public/*,.build/*',
          },
          stdin = false,
        },
      },
    },
    init = function()
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })

      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
