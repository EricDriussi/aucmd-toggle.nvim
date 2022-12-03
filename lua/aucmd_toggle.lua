local module = require("aucmd_toggle.module")

local M = {}
local config = {}

M.setup = function(args)
  if type(args) ~= "table" then
    error("Setup func only accepts table as arg")
  else
    config = vim.tbl_deep_extend("force", config, args or {})
  end
end

M.by_group = function(name)
  module.toggle_by_augroup(name)
end

M.by_event = function(event)
  module.toggle_by_event(event)
end

return M
