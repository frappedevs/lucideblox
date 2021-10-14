return function(PluginService, assets, modules, widget)
    local stylesheet = require(modules.util.stylesheet)
    widget = widget.View

    local function applyColorsToIcon(themeStylesheet, icon)
        icon.Background.BackgroundColor3 = themeStylesheet.Accent
        icon.Background.Cover.BackgroundColor3 = themeStylesheet.Elevated
        icon.Container.Image.ImageColor3 = themeStylesheet.Icon
        icon.Container.Title.TextColor3 = themeStylesheet.Text
    end

    local function applyColors()
        local themeOption = settings().Studio.Theme
        local themeStylesheet = stylesheet[themeOption.Name]
        widget.UI.BackgroundColor3 = themeStylesheet.Background
        widget.UI.Search.Background.BackgroundColor3 = themeStylesheet.Accent
        widget.UI.Search.Background.Cover.BackgroundColor3 = themeStylesheet.Elevated
        widget.UI.Search.Gradient.BackgroundColor3 = themeStylesheet.Background
        widget.UI.Search.Container.TextBox.PlaceholderColor3 = themeStylesheet.Placeholder
        widget.UI.Search.Container.TextBox.TextColor3 = themeStylesheet.Text

        widget.UI.ScrollerBackground.BackgroundColor3 = themeStylesheet.ScrollerBackground
        widget.UI.List.ScrollBarImageColor3 = themeStylesheet.ScrollBar

        applyColorsToIcon(themeStylesheet, assets.Icon)
        for _, object in ipairs(widget.UI.List:GetChildren()) do
            if object:IsA("Frame") then
                applyColorsToIcon(themeStylesheet, object)
            end
        end
    end

    applyColors()
    settings().Studio.ThemeChanged:Connect(applyColors)
end