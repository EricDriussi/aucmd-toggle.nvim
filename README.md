# aucmd-toggle

Super basic toggle for your predefined autocommands.

## Usage

Say you want to toggle on/off one or more autocommands.

### By event

Choose an event for which you wish to toggle **all aucmds**, `BufWritePre` for example.

```vim
:ToggleAucmdsByEvent BufWritePre
```

This is kind of a shotgun approach, for a more fine-grained control...

### By autogroup

Create an augroup for your command/s, `OnSaveGroup` for example.

```lua
local on_save_grp = vim.api.nvim_create_augroup("OnSaveGroup", {})
```

Add your desired command/s to it.

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  group = on_save_grp,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = on_save_grp,
  callback = function()
    print("hi mom")
  end
})
```

Toggle to your heart's content!

```vim
:ToggleAucmdsByGroup OnSaveGroup
```

## Use Case

I usually have some sort of *format/do stuff on save* aucmd set up to help me out while I code.

Often enough, when working with a huge legacy code base, I need to make sure **NOT** to format a whole file (for obvious reasons).

In general, there are situations where the "*always do this on save*" approach is just not an option.

I wanted a simple way to tell nvim "*ok, **now** do your thing*" or "*let me handle this myself*", so I made this.

Mind you, if you just want a way to only format the lines you've changed [this](https://github.com/joechrisellis/lsp-format-modifications.nvim) lovely plugin might suit your needs much better!
