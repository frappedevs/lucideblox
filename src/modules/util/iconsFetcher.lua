local HttpService = game:GetService("HttpService")

local DEFAULT_ICONS = require(script.Parent.icons)
local ICONS_SOURCE_URI = "https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json"

local success, response = pcall(HttpService.GetAsync, HttpService, ICONS_SOURCE_URI)

if success then
	warn("Loaded icons via githubusercontent")
	return HttpService:JSONDecode(response)
end

warn("Failed to load icons source from the web, fallback to default source: " .. tostring(response))
return DEFAULT_ICONS