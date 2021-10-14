local module = {}

module.Dark = {}
module.Light = {}

module.Dark.Background = Color3.fromRGB(29, 29, 29)
module.Dark.Accent = Color3.fromRGB(65, 65, 65)
module.Dark.ScrollBar = Color3.fromRGB(44, 44, 44)
module.Dark.ScrollerBackground = Color3.fromRGB(23, 23, 23)
module.Dark.Elevated = Color3.fromRGB(37, 37, 37)
module.Dark.Placeholder = Color3.fromRGB(100, 100, 100)
module.Dark.Text = Color3.fromRGB(250, 250, 250)
module.Dark.Icon = Color3.fromRGB(255, 255, 255)

module.Light.Background = Color3.fromRGB(235, 235, 235)
module.Light.Accent = Color3.fromRGB(205, 205, 205)
module.Light.ScrollBar = Color3.fromRGB(150, 150, 150)
module.Light.ScrollerBackground = Color3.fromRGB(200, 200, 200)
module.Light.Elevated = Color3.fromRGB(245, 245, 245)
module.Light.Placeholder = Color3.fromRGB(150, 150, 150)
module.Light.Text = Color3.fromRGB(100, 100, 100)
module.Light.Icon = Color3.fromRGB(100, 100, 100)

module.PrimaryColor3 = settings().Studio["Select Color"]
	
return module