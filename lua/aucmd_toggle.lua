local module = require("aucmd_toggle.module")

local M = {}
local config = {
  -- default config
  opt = "Hello!",
}

-- user config
M.setup = function(args)
  config = vim.tbl_deep_extend("force", config, args or {})
end

-- entry point for module/s
M.toggle = function(augroup, aucmds_by_group)
  module.toggle(augroup, aucmds_by_group)
end

return M
