local p = require("aucmd_toggle.module")
local h = require("tests.helper")

describe("module should", function()
  before_each(function()
    h.clear_store()
  end)

  after_each(function()
    h.clear_store()
  end)

  it("turn a group off", function()
    local augroup = "a_real_augroup"
    h.aucmds.make.with_group(augroup)

    local aucmds_before = h.aucmds.get.by_group(augroup)
    p.toggle(augroup, aucmds_before)

    local aucmds_after = h.aucmds.get.by_group(augroup)
    assert.equals(0, #aucmds_after)
  end)

  it("turn a group off and on", function()
    local augroup = "a_real_augroup"
    h.aucmds.make.with_group(augroup)

    local aucmds_before = h.aucmds.get.by_group(augroup)
    p.toggle(augroup, aucmds_before)

    local aucmds_between = h.aucmds.get.by_group(augroup)
    p.toggle(augroup, aucmds_between)

    local aucmds_after = h.aucmds.get.by_group(augroup)
    assert.are.equals(#aucmds_before, #aucmds_after)
  end)
end)
