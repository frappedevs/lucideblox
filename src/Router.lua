local Packages = script.Parent.Packages
local Views = script.Parent.Views

local FusionRouter = require(Packages.FusionRouter)

local Router = FusionRouter.new({
    {
        Path = "/",
        View = require(Views.Home),
        Meta = {
            Title = "Home",
        },
    },

    {
        Path = "/search/:query:/",
        View = require(Views.Search),
        Meta = {
            Title = "Search icons",
        }
    },

    {
        Path = "/icon/:id:/",
        View = require(Views.Icon),
        Meta = {
            Title = "Viewing icon",
        }
    },

    {
        Path = "/settings/",
        View = require(Views.Settings),
        Meta = {
            Title = "Plugin settings",
        }
    },

    {
        Path = "/info/",
        View = require(Views.Info),
        Meta = {
            Title = "About this plugin",
        }
    }
})

return Router