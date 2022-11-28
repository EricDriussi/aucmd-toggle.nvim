local function log_table(tabl)
  print(vim.inspect(tabl))
end

local t = require("aucmd_toggle.toggle")

describe("toggle should", function()

  local new_au_cmd = vim.api.nvim_create_autocmd
  local new_au_grp = vim.api.nvim_create_augroup

  it("turn off", function()
    local augroup = "a_real_augroup"
    new_au_cmd(
      "BufWritePre", {
      desc = "A Real Aucmd",
      group = new_au_grp(augroup, {}),
      callback = function()
        print("do stuff")
      end
    })

    local aucmds_by_group = vim.api.nvim_get_autocmds({ group = augroup })
    t.toggle(augroup, aucmds_by_group)

    local aucmds_by_group_after_toggle = vim.api.nvim_get_autocmds({ group = augroup })
    log_table(aucmds_by_group_after_toggle)
    assert.equals(#aucmds_by_group_after_toggle, 0)
  end)
end)
