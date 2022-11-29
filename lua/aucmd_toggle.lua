local module = require("aucmd_toggle.module")

local M = {}
M.config = {
  -- default config
  opt = "Hello!",
}

-- user config
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

-- entry point for module/s
M.toggle = function(augroup, aucmds_by_group)
  module.toggle(augroup, aucmds_by_group)
end

return M
