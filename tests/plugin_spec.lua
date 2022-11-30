require("plugin.aucmd_toggle")

describe("plugin should", function()
  describe("create", function()
    it("ToggleAucmdsByGroup user command", function()
      local group_name = "a_valid_group"
      vim.api.nvim_create_augroup(group_name, {})
      assert.has_no.errors(function()
        vim.cmd("ToggleAucmdsByGroup " .. group_name)
      end)
    end)

    it("ToggleAucmdsByEvent user command", function()
      assert.has_no.errors(function()
        vim.cmd("ToggleAucmdsByEvent BufWritePre")
      end)
    end)
  end)

  describe("error out when", function()
    it("passed group doesn't exist", function()
      local group_name = "an_invalid_group"
      assert.has.errors(function()
        vim.cmd("ToggleAucmdsByGroup " .. group_name)
      end)
    end)

    it("passed event doesn't exist", function()
      assert.has.errors(function()
        vim.cmd("ToggleAucmdsByEvent invalid_event")
      end)
    end)
  end)
end)
