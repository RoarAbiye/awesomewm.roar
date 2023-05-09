local awful = require("awful")
-- local wibox = require("wibox")
-- local gears = require("gears")
local t_names = require("main.tag_names")


local _M = {}

function _M.get ()
   local tags = {}
   -- local tagpairs = {
   --   names = { -- }

   -- awful.screen.connect_for_each_screen(function(s)
   --   tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
   -- end)

    return tags
end



awful.tag.add( "1", {
    name = t_names[1],
    index = 1,
    layout             = awful.layout.suit.tile,
    gap_single_client  = true,
    screen             = s,
    selected           = true,
})

awful.tag.add("2", {
    name = t_names[2],
    master_fill_policy = "master_width_factor",
    index = 2,
    layout = awful.layout.suit.tile,
    screen = s,
})
awful.tag.add("3", {
    name = t_names[3],
    layout = awful.layout.suit.max,
    screen = s,
})
awful.tag.add("4", {
    name = t_names[4],
    layout = awful.layout.suit.max,
    screen = s,
})
awful.tag.add("5", {
    name = t_names[5],
    layout = awful.layout.suit.max,
    screen = s,
})
awful.tag.add("6", {
    name = t_names[6],
    layout = awful.layout.suit.max,
    screen = s,
})
awful.tag.add("7", {
    name = t_names[7],
    master_fill_policy = "master_width_factor",
    layout = awful.layout.suit.tile,
    screen = s,
})
awful.tag.add("8", {
    name = t_names[8],
    master_fill_policy = "master_width_factor",
    index = 8,
    layout = awful.layout.suit.tile,
    screen = s,
})
awful.tag.add("9", {
    name = t_names[9],
    layout = awful.layout.suit.max,
    screen = s,

})

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end })
