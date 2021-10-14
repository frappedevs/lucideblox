return function(PluginService, assets, modules, widget)
    local iconComponent = require(modules.components.icon)
    local icons = require(modules.util.icons)

    for name, id in pairs(icons.icons) do
        local icon = iconComponent.new(name, id, widget.View.UI.List)
    end
end