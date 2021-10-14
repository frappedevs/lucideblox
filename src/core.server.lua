local PluginService = plugin

local assets = script.Parent.assets
local modules = script.Parent.modules
local builders = modules.builders
local util = modules.util

local widget = require(builders.pluginview)(PluginService, assets, modules)
require(builders.stylepainter)(PluginService, assets, modules, widget)
require(builders.iconloader)(PluginService, assets, modules, widget)
require(builders.search)(PluginService, assets, modules, widget)