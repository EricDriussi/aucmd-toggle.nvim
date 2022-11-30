local p = require("aucmd_toggle")

describe("toggle should", function()

  it("expose setup({}) function", function()
    assert.has.errors(function() p.setup("string") end)
    assert.has.errors(function() p.setup(123) end)
    assert.has_no.errors(function() p.setup({}) end)
  end)

  it("not expose config table", function()
    assert.equals(nil, p.config)
  end)
end)
