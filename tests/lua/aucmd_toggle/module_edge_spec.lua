local p = require("aucmd_toggle.module")
local h = require("tests.helper")

describe("toggle edge cases:", function()
  before_each(function()
    h.clear_store()
  end)
  after_each(function()
    h.clear_store()
  end)

  describe("by groups", function()
    local augroup = "a_real_augroup"

    it("without description", function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup(augroup, {}),
        callback = function()
          print("do stuff")
        end,
      })
      local aucmds_before = h.aucmds.get.by_group(augroup)

      p.toggle_by_augroup(augroup)
      p.toggle_by_augroup(augroup)

      local aucmds_after = h.aucmds.get.by_group(augroup)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)

    it("command instead of callback", function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "A real aucmd by event",
        group = vim.api.nvim_create_augroup(augroup, {}),
        command = "set formatoptions-=cro",
      })
      local aucmds_before = h.aucmds.get.by_group(augroup)

      p.toggle_by_augroup(augroup)
      p.toggle_by_augroup(augroup)

      local aucmds_after = h.aucmds.get.by_group(augroup)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)
  end)

  describe("by events", function()
    local event = "BufWritePost"

    it("without description", function()
      vim.api.nvim_create_autocmd(event, {
        desc = "A real aucmd by event",
        group = vim.api.nvim_create_augroup("a_real_group", {}),
        callback = function()
          print("do stuff")
        end,
      })
      local aucmds_before = h.aucmds.get.by_event(event)

      p.toggle_by_event(event)
      p.toggle_by_event(event)

      local aucmds_after = h.aucmds.get.by_event(event)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)

    it("command instead of callback", function()
      vim.api.nvim_create_autocmd(event, {
        desc = "A real aucmd by event",
        group = vim.api.nvim_create_augroup("a_real_group", {}),
        command = "set formatoptions-=cro",
      })
      local aucmds_before = h.aucmds.get.by_event(event)

      p.toggle_by_event(event)
      p.toggle_by_event(event)

      local aucmds_after = h.aucmds.get.by_event(event)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)

    it("without group", function()
      vim.api.nvim_create_autocmd(event, {
        desc = "A real aucmd by event",
        callback = function()
          print("do stuff")
        end,
      })
      local aucmds_before = h.aucmds.get.by_event(event)

      p.toggle_by_event(event)
      p.toggle_by_event(event)

      local aucmds_after = h.aucmds.get.by_event(event)
      assert.are.equals(#aucmds_before, #aucmds_after)
    end)
  end)
end)
