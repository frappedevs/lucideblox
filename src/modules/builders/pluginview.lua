local TweenService = game:GetService("TweenService")

local standardTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quint)
local dockWidgetPluginInfo = DockWidgetPluginGuiInfo.new(
    Enum.InitialDockState.Float,
    false,
    true,
    200,
    300,
    200,
    300
)

return function(PluginService, assets, modules)
    local widget = PluginService:CreateDockWidgetPluginGui("LucideIcons", dockWidgetPluginInfo)
    widget.Title = "Lucide Icons"
    widget.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local widgetToolbar = PluginService:CreateToolbar("Lucide Icons")
    local widgetTrigger = widgetToolbar:CreateButton("toggleLucide", "Toggles the icon picker", "rbxassetid://7734199131", "Toggle Picker")
    widgetTrigger.ClickableWhenViewportHidden = true

    local widgetView = assets.UI:Clone()
    widgetView.Parent = widget

    widgetTrigger.Click:Connect(function()
        widget.Enabled = not widget.Enabled
        widgetTrigger:SetActive(widget.Enabled)
    end)

    widget:BindToClose(function()
        widgetTrigger:SetActive(false)
        widget.Enabled = false   
    end)

    widgetView.List.UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TweenService:Create(widgetView.List, standardTweenInfo, {CanvasSize = UDim2.new(0, 0, 0, widgetView.List.UIGridLayout.AbsoluteContentSize.Y + 24)}):Play()
        if widgetView.List.UIGridLayout.AbsoluteContentSize.Y + 24 > widgetView.List.AbsoluteSize.Y then
            widgetView.ScrollerBackground.Visible = true
        else
            widgetView.ScrollerBackground.Visible = false
        end
    end)

    return {
        ["View"] = widget,
        ["Trigger"] = widgetTrigger,
        ["Toolbar"] = widgetToolbar
    }
end