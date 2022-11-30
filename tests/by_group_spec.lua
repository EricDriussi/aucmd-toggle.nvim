local p = require("aucmd_toggle")
local h = require("tests.helper")

describe("toggle should", function()

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
    assert.equals(#aucmds_after, 0)
  end)

  it("turn a group off and on", function()
    local augroup = "a_real_augroup"
    h.aucmds.make.with_group(augroup)

    local aucmds_before = h.aucmds.get.by_group(augroup)
    p.toggle(augroup, aucmds_before)

    local aucmds_between = h.aucmds.get.by_group(augroup)
    p.toggle(augroup, aucmds_between)

    local aucmds_after = h.aucmds.get.by_group(augroup)
    assert.are.equals(#aucmds_after, #aucmds_before)
  end)
end)
