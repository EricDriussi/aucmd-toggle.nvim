if vim.g.loaded_aucmd_toggle == 1 then
  return
end
vim.g.loaded_aucmd_toggle = 1

vim.api.nvim_create_user_command("ToggleAucmdsByGroup", function(input)
  require("aucmd_toggle").by_group(input.args)
end, {
  desc = "Global toggle for aucmds in given augroup",
  nargs = 1,
})

vim.api.nvim_create_user_command("ToggleAucmdsByEvent", function(input)
  require("aucmd_toggle").by_event(input.args)
end, {
  desc = "Global toggle for aucmds by given event",
  nargs = 1,
})
