-- Standard awesome library
xdg_menu = require("archmenu")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {} -- menu
local _M = {} --moducle

local terminal = RC.vars.terminal

-- Variable Definitions
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
    {"hotkeys", function()
        hotkeys_popup.show_help(nil, awful.screen.focused())
    end},
    {"manual", terminal .. " -e man awesome"},
    {"edit config", editor_cmd .. " " .. awesome.conffile },
    {"terminal", terminal},
    {"poweroff", "poweroff"},
    {"restart awesome", awesome.restart},
    {"quit", function() awesome.quit() end}
}

-----------------------------------------------------------

M.favorite = {
  { " nemo", "nemo" },
  { " firefox", "firefox" },
  { " thunderbird", "thunderbird" },
  { " libreoffice", "libreoffice" },
  { " gimp", "gimp" },
  { "縉 inkscape", "inkscape" }
}

-----------------------------------------------------------

function _M.get()
    local menu_items = {
        {" Applications", xdgmenu},
        {"舘 awesome", M.awesome, beautiful.awesome_subicon },
        {" terminal", terminal},
        {" favorite", M.favorite }
    }
    return menu_items
end

-----------------------------------------------------------

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
