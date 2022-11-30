M = {}

function M.log_table(tabl)
  print(vim.inspect(tabl))
end

function M.clear_store()
  require("aucmd_toggle.module").aucmds_by_selection = {}
end

M.aucmds = {
  get = {
    by_group = function(augroup)
      return vim.api.nvim_get_autocmds({ group = augroup })
    end,

    by_event = function(event)
      return vim.api.nvim_get_autocmds({ event = event })
    end
  },

  make = {
    with_group = function(augroup)
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "A Real Aucmd",
        group = vim.api.nvim_create_augroup(augroup, {}),
        callback = function()
          print("do stuff")
        end
      })
    end,

    with_event = function(event)
      vim.api.nvim_create_autocmd(event, {
        desc = "A Real Aucmd",
        group = vim.api.nvim_create_augroup("a_real_group", {}),
        callback = function()
          print("do stuff")
        end
      })
    end
  }
}

return M
