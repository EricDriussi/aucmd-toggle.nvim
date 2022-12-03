local p = require("aucmd_toggle.module")
local h = require("tests.helper")

describe("module should", function()
  before_each(function()
    h.clear_store()
  end)

  after_each(function()
    h.clear_store()
  end)

  describe("turn off", function()
    it("by group", function()
      local augroup = "a_real_augroup"
      h.aucmds.make.with_group(augroup)

      p.toggle_by_augroup(augroup)

      local aucmds_after = h.aucmds.get.by_group(augroup)
      assert.equals(0, #aucmds_after)
    end)

    it("by event", function()
      local event = "BufWritePost"
      h.aucmds.make.with_event(event)

      p.toggle_by_event(event)

      local aucmds_after = h.aucmds.get.by_event(event)
      assert.equals(0, #aucmds_after)
    end)
  end)

  describe("turn off and on", function()
    it("by group", function()
      local augroup = "a_real_augroup"
      h.aucmds.make.with_group(augroup)
      local aucmds_before = h.aucmds.get.by_group(augroup)

      p.toggle_by_augroup(augroup)
      p.toggle_by_augroup(augroup)

      local aucmds_after = h.aucmds.get.by_group(augroup)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)

    it("by event", function()
      local event = "BufWritePost"
      h.aucmds.make.with_event(event)
      local aucmds_before = h.aucmds.get.by_event(event)

      p.toggle_by_event(event)
      p.toggle_by_event(event)

      local aucmds_after = h.aucmds.get.by_event(event)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)
  end)
end)
