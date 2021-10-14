local icon = {}

local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local assets = script.Parent.Parent.Parent.assets
local modules = script.Parent.Parent

local stylesheet = require(modules.util.stylesheet)

function icon.new(name, id, parent)
    local object = assets.Icon:Clone()
    object.Name, object.Container.Title.Text = name, name
    object.Container.Image.Image = id

    object.Trigger.MouseEnter:Connect(function()
        object.Background.BackgroundColor3 = stylesheet.PrimaryColor3
    end)

    object.Trigger.MouseLeave:Connect(function()
        local themeOption = settings().Studio.Theme.Name
        object.Background.BackgroundColor3 = stylesheet[themeOption].Accent
    end)

    object.Trigger.MouseButton1Click:Connect(function()
        local themeOption = settings().Studio.Theme.Name
        local currentSelection = Selection:Get()
        object.Background.BackgroundColor3 = stylesheet[themeOption].Accent

        ChangeHistoryService:SetWaypoint("Inserting/Applying icon " .. name .. " to selections")
        for _, selectedObject in ipairs(currentSelection) do
            if selectedObject:IsA("ImageLabel") or selectedObject:IsA("ImageButton") then
                selectedObject.Image = id
            else
                local image = Instance.new("ImageLabel")
                local aspectRatioConstraint = Instance.new("UIAspectRatioConstraint", image)
                image.BackgroundTransparency = 1
                image.Name = "Icon"
                image.Image = id
                image.Parent = selectedObject
            end
        end
        ChangeHistoryService:SetWaypoint("After insertion/application of icon " .. name .. " to selections")
    end)

    object.Parent = parent
end

return icon