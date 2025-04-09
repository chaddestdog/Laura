local Lib = {}

function Create(ClassName,Properties)
	local instance = Instance.new(ClassName);
	table.foreach((Properties or {}),function(i,v)
		instance[i] = v
	end);
	return instance
end;

function Fix(args,defaults)
	args = args or {};
	table.foreach((defaults or {}),function(i,v)
		if args[i] == nil then
			args[i] = v
		end
	end);
	return args
end;


function Lib:CreateWindow(args)
	args = Fix(args,{Title = "Hacked Panel"});
	local Window = {Current_Tab = nil,UI = {}};
	------------------------------------------------------------------------
	-- Gui
	Window.UI["1"] = Create("ScreenGui", {Parent = gethui(),ZIndexBehavior = Enum.ZIndexBehavior.Global});
	-- Gui.Window
	Window.UI["2"] = Create("Frame", {Parent = Window.UI["1"],BorderSizePixel = 1,BackgroundColor3 = Color3.fromRGB(46, 46, 46),AnchorPoint = Vector2.new(0.5, 0.5),Size = UDim2.new(0, 300, 0, 200),Position = UDim2.new(0.5, 0, 0.5, 0),BorderColor3 = Color3.fromRGB(28, 43, 54)});
	-- Gui.Window.Tabs
	Window.UI["3"] = Create("ScrollingFrame", {Parent = Window.UI["2"],BorderSizePixel = 0,CanvasSize = UDim2.new(0, 0, 0, 0),BackgroundColor3 = Color3.fromRGB(57, 57, 57),ScrollBarImageTransparency = 1,AnchorPoint = Vector2.new(0.5, 0),AutomaticCanvasSize  = Enum.AutomaticSize.Y,Size = UDim2.new(0, 88, 0, 178),ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),Position = UDim2.new(0, 44, 0, 22),ScrollBarThickness = 0});
	-- Gui.Window.Tabs.ListLayout
	Window.UI["4"] = Create("UIListLayout", {Parent = Window.UI["3"],HorizontalAlignment = Enum.HorizontalAlignment.Center,SortOrder = Enum.SortOrder.LayoutOrder});
	-- Gui.Window.Topbar
	Window.UI["5"] = Create("Frame", {Parent = Window.UI["2"],BorderSizePixel = 0,AnchorPoint = Vector2.new(0.5, 0),Size = UDim2.new(1, 0, 0, 22),Position = UDim2.new(0.5, 0, 0, 0),BackgroundTransparency = 1});
	-- Gui.Window.Topbar.Title
	Window.UI["6"] = Create("TextLabel", {Parent = Window.UI["5"],BorderSizePixel = 0,TextSize = 14,FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),TextColor3 = Color3.fromRGB(255, 255, 255),BackgroundTransparency = 1,AnchorPoint = Vector2.new(0, 0.5),Size = UDim2.new(0, 0, 1, 0),BorderColor3 = Color3.fromRGB(0, 0, 0),Text = args.Title,AutomaticSize = Enum.AutomaticSize.X,Position = UDim2.new(0, 5, 0.5, 0)});
	------------------------------------------------------------------------

	function Window:Show(bool)
		Window.UI["2"].Visible = bool;
	end;

	function Window:AddTab(args)
		args = Fix(args,{Title = "??????"});
		local Tab = {Active = false,UI = {},Type = "Tab",Title = args.Title};
		--------------------------------------------------------------------
		-- Gui.Window.Tabs.Toggles
		Tab.UI["1"] = Create("TextButton", {Parent =  Window.UI["3"],BorderSizePixel = 0,TextColor3 = Color3.fromRGB(255, 255, 255),TextSize = 14,BackgroundColor3 = Color3.fromRGB(57, 57, 57),FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal),AnchorPoint = Vector2.new(0.5, 0),Size = UDim2.new(1, 0, 0.004, 29),Text = args.Title});
		-- Gui.Window.Toggles
		Tab.UI["2"] = Create("ScrollingFrame", {Parent =  Window.UI["2"],BorderSizePixel = 0,CanvasSize = UDim2.new(0, 0, 0, 0),TopImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]],BottomImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]],AnchorPoint = Vector2.new(0.5, 0),AutomaticCanvasSize = Enum.AutomaticSize.Y,Size = UDim2.new(0, 212, 0, 178),ScrollBarImageColor3 = Color3.fromRGB(156, 156, 156),Position = UDim2.new(0.64667, 0, 0.11, 0),ScrollBarThickness = 10,BackgroundTransparency = 1,Visible = false});
		-- Gui.Window.Toggles.UIListLayout
		Tab.UI["3"] = Create("UIListLayout", {Parent = Tab.UI["2"],Padding = UDim.new(0, 6),SortOrder = Enum.SortOrder.LayoutOrder});
		--------------------------------------------------------------------
		function Tab.UI:Activate()
			if not Tab.Active then
				if Window.Current_Tab then
					if Window.Current_Tab.Active then
						Window.Current_Tab.UI["2"].Visible = false;
						Window.Current_Tab.Active = false;
					end;
				end;
				Tab.UI["2"].Visible = true;
				Tab.Active = true
				Window.Current_Tab = Tab;
			end;
		end;

		if Window.Current_Tab == nil then Tab.UI:Activate() end;
		Tab.UI["1"].MouseButton1Click:Connect(function() Tab.UI:Activate() end);
		--------------------------------------------------------------------
		function Tab:AddToggle(args)
			args = Fix(args,{Title = "????????????",Callback = function() end,OnChanged = function() end});
			local Toggle = {Active = false,UI = {}};
			--------------------------------------------------------------------
			-- Gui.Window.Toggles.ForceDay
			Toggle.UI["1"] = Create("TextButton", {Parent = Tab.UI["2"],BorderSizePixel = 0,TextColor3 = Color3.fromRGB(255, 255, 255),TextXAlignment = Enum.TextXAlignment.Left,AutoButtonColor = false,TextSize = 14,BackgroundColor3 = Color3.fromRGB(101, 101, 101),FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal),AnchorPoint = Vector2.new(0, 0.5),Size = UDim2.new(0, 200, 0, 18),Text = args.Title});
			-- Gui.Window.Toggles.ForceDay.Toggled
			Toggle.UI["2"] = Create("Frame", {Parent = Toggle.UI["1"],BorderSizePixel = 2,BackgroundColor3 = Color3.fromRGB(56, 56, 56),BorderMode = Enum.BorderMode.Inset,AnchorPoint = Vector2.new(0.5, 0.5),Size = UDim2.new(0, 14, 0, 14),Position = UDim2.new(1, -8, 0.5, 0),BorderColor3 = Color3.fromRGB(91, 91, 91)});
			-- Gui.Window.Toggles.ForceDay.UIPadding
			Toggle.UI["3"] = Create("UIPadding", {Parent = Toggle.UI["1"],PaddingLeft = UDim.new(0, 3)});
			--------------------------------------------------------------------
			Toggle.UI["1"].MouseButton1Click:Connect(function() 
				Toggle.Active = not Toggle.Active;
				args.Callback(Toggle.Active);
				args.OnChanged(Toggle.Active);
				Toggle.UI["2"].BackgroundColor3 = Toggle.Active and Color3.fromRGB(85, 177, 71) or Color3.fromRGB(56, 56, 56);	
			end);
			--------------------------------------------------------------------	
			function Toggle:OnChanged(func) 
				args.OnChanged = func 
			end;return Toggle
		end;return Tab
	end;return Window
end;return Lib
