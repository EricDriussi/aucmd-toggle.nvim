local M = {}
M.aucmds_by_selection = {}

local function turn_off(selection, aucmds_to_toggle)
  for _, cmd in pairs(aucmds_to_toggle) do
    table.insert(M.aucmds_by_selection[selection], cmd)
    vim.api.nvim_del_autocmd(cmd.id)
    print(cmd.desc .. " turned OFF")
  end
end

local function turn_on_by(selection)
  for _, cmd in pairs(M.aucmds_by_selection[selection]) do
    vim.api.nvim_create_autocmd(cmd.event, {
      desc = cmd.desc,
      group = cmd.group_name,
      callback = cmd.callback,
    })
    print(cmd.desc .. " turned ON")
  end
  M.aucmds_by_selection[selection] = {}
end

function M.toggle_by_augroup(group_name)
  if M.aucmds_by_selection[group_name] == nil then
    M.aucmds_by_selection[group_name] = {}
  end

  local aucmds = vim.api.nvim_get_autocmds({ group = group_name })
  local cmds_are_set = next(aucmds) ~= nil
  if cmds_are_set then
    turn_off(group_name, aucmds)
  else
    turn_on_by(group_name)
  end
end

function M.toggle_by_event(event_name)
  if M.aucmds_by_selection[event_name] == nil then
    M.aucmds_by_selection[event_name] = {}
  end

  local aucmds = vim.api.nvim_get_autocmds({ event = event_name })
  local cmds_are_set = next(aucmds) ~= nil
  if cmds_are_set then
    turn_off(event_name, aucmds)
  else
    turn_on_by(event_name)
  end
end

return M
