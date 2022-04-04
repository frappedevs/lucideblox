local Packages = script.Parent.Packages
local Utils = script.Parent.Utils

local Fusion = require(Packages.Fusion)
local Components = require(Packages.FusionStudioComponents)
local Icons = require(Utils.Icons)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local ForPairs = Fusion.ForPairs

local Background = require(Components.Studio.Background)
local ScrollFrame = require(Components.Studio.ScrollFrame)
local Button = require(Components.Studio.Button)
local ThemeProvider = require(Components.Studio.Utils.themeProvider)

return function(props)
    local page = Value(1)

    return Background {
        [Children] = {
            ScrollFrame {
                [Children] = {
                    New "UIGridLayout" {
                        CellSize = UDim2.new(0.25, 0, 0, 36),
                        CellPadding = UDim2.fromScale(0, 0),
                    },

                    ForPairs(Icons[page:get()], function(index, key)
                        return Button {
                            Text = "",

                            [Children] = {
                                New "ImageLabel" {
                                    BackgroundTransparency = 1,
                                    Image = key.Image,
                                    ImageColor3 = ThemeProvider:GetColor(Enum.StudioStyleGuideColor.ButtonText, Enum.StudioStyleGuideModifier.Default),

                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    Size = UDim2.new(0, 24, 0, 24),
                                }
                            },

                            Activated = function()
                                props.Router:Push("/icon/" .. index .. "/")
                            end,
                        }
                    end)
                }
            }
        }
    }
end