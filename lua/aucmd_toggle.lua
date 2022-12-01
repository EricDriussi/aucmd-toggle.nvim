local module = require("aucmd_toggle.module")

local M = {}
local config = {
  -- default config
  opt = "Hello!",
}

-- user config
M.setup = function(args)
  if type(args) ~= "table" then
    error("Setup func only accepts table as arg")
  else
    config = vim.tbl_deep_extend("force", config, args or {})
  end
end

-- entry point for module/s
M.toggle = function(augroup, aucmds_by_group)
  module.toggle(augroup, aucmds_by_group)
end

return M
