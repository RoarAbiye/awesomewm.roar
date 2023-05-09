-- Standard awesome library
local awful     = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
local tags = require("main.tags")
local tag_names = require("main.tag_names")
-- local tags = awful.screen.tags


local _M = {}


function _M.get(clientkeys, clientbuttons)

local rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },
    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
          "Qalculate-gtk"
        },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester", -- xev.
          "Picture in picture" -- Brave Browser  
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, 

      properties = { floating = true }
  },

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    { rule = { class = "Brave-browser"},
               properties = {
                   screen = 1, tag = tag_names[1],
                   switchtotag = true,
                   titlebars_enabled = true
               }
    },

    { rule = { class = "Alacritty"},
      properties = { screen = 1, tag = tag_names[2],
        switchtotag = true
      } },

    { rule = { class = "kitty"},
      properties = { screen = 1, tag = tag_names[2],
        switchtotag = true
      } },
    { rule = { class = "Emacs"},
      properties = { screen = 1, tag = tag_names[2],
        switchtotag = true
      } },
    { rule = { class = "KotatogramDesktop" },
      properties = { screen = 1, tag = tag_names[7],
       switchtotag = true
      } },

  {
      rule_any = {
        instance = {'music', 'nuclear', 'spotify'}
      },
      properties = {
        screen = 1,
        tag = tag_names[8],
        switchtotag = true
      }
  },
  {
      rule_any = {
          instance = {'DesktopEditors'}, 
          properties = {
              screen = 1,
              tag = tag_names[5],
              switchtotag = true
          }
      }
  },
  {
      rule_any = { class = "rofi" },
      properties = {
        border_width =0,
        border_color = "#00000000"
      }
    }
}
return rules
end

return setmetatable( {}, { __call = function(_, ...) return _M.get(...) end })

