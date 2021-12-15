```lua
--Create UI
local FreeUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZens/x09_log/main/8XhxMNRvRtfree.lua"))()

local Window = FreeUI:cre("Free UI")
```
```lua
-- Create Tap
local Tap = Window:tab("Main")
```

```lua
-- Create Page
local page1 = Tap:page("Page")
```

```lua
-- Document

page1:Label("Label") -- Label

page1:Button("Button",function() -- Button
	
end)

page1:Toggle("Toggle",false,function() -- Toggle
	
end)

local drop = page1:Dropdown("DropDown",{"1","2","3"},function (v) -- Dropdown
	_G.drop = v
end)

page1:Button("Clear",function() -- Clear Dropdown
	drop:Clear()
end)

page1:Button("Add",function() -- Add Dropdown
	drop:Add("Test")
end)

local Test2 = page1:Slider("Slider",true,0,100,10,10,function(v) -- Slider
	print(v)
end)

page1:Textbox("TextBox","TextBox2",function(v) -- TextBox
	_G.Textbox = v
	print(_G.Textbox)
end)

page1:Line() -- Line
```
