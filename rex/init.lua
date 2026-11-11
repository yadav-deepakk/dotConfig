-- ~/.config/rex/init.lua
local shell = "com.superlogical.terminal.shell"

rex.action {
  name  = "popup_lazygit",
  title = "Open lazygit in Popup",
  run   = function(ctx)
    -- open in the focused pane's working directory
    local cwd = os.getenv("HOME")
    local p = rex.block.call("com.superlogical.terminal", "process", { block_id = ctx.block_id })
    if p and p.foreground and p.foreground.cwd then
      cwd = p.foreground.cwd
    end

    local _, err = rex.session.new_layer {
      bounds = { 0.01, 0.01, 0.97, 0.97 }, -- x, y, width, height as fractions of the window
      layout = rex.layout.block {
        flavor  = shell,
        options = { command = { "lazygit" }, cwd = cwd },
      },
      focus = true,
    }
    if err ~= nil then error(err, 0) end
  end,
}

rex.bind("cmd+shift+g", "popup_lazygit") -- change to whatever key you like
