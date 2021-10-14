return function(PluginService, assets, modules, widget)
    local matcher = require(modules.util.matcher)
    local candidates = {}
    local search = widget.View.UI.Search
    local list = widget.View.UI.List

    for name, _ in pairs(require(modules.util.icons).icons) do
        table.insert(candidates, name)
    end

    search.Container.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        local text = search.Container.TextBox.Text
        for _, icon in ipairs(list:GetChildren()) do
            if icon:IsA("Frame") then
                icon.LayoutOrder = 0
                icon.Visible = true
            end
        end

        if text:gsub("%s", "") and text:gsub("%s", ""):len() >= 1 then
            local matchResult = matcher.new(candidates, true, true):match(text)
            for _, icon in ipairs(list:GetChildren()) do
                if icon:IsA("Frame") then
                    icon.Visible = false
                end
            end

            for position, name in ipairs(matchResult) do
                local icon = list:FindFirstChild(name)
                if icon and icon:IsA("Frame") then
                    icon.LayoutOrder = position
                    icon.Visible = true
                end
            end
        end
    end)
end