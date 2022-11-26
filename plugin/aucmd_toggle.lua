if vim.g.loaded_aucmd_toggle == 1 then
  return
end
vim.g.loaded_aucmd_toggle = 1


vim.api.nvim_create_user_command(
  "ToggleAucmdsByGroup",
  function(input)
    local augroup = input.args
    local aucmds_by_group = vim.api.nvim_get_autocmds({ group = augroup })
    require("aucmd_toggle").toggle(augroup, aucmds_by_group)
  end,
  {
    desc = "Global toggle for given augroup",
    nargs = 1
  }
)

vim.api.nvim_create_user_command(
  "ToggleAucmdsByEvent",
  function(input)
    local event = input.args
    local aucmds_by_event = vim.api.nvim_get_autocmds({ event = event })
    require("aucmd_toggle").toggle(event, aucmds_by_event)
  end,
  {
    desc = "Global toggle for aucmds for given event",
    nargs = 1
  }
)
