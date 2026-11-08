-- HatchDefend 2.0: non-invasive interface polish.
-- Only affects GUI objects tagged with the HD2_ prefix.
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local function polish(button)
    if not button:IsA("GuiButton") or not button.Name:match("^HD2_") then return end
    if button:GetAttribute("HD2Polished") then return end
    button:SetAttribute("HD2Polished", true)
    button.AutoButtonColor = false
    local corner = button:FindFirstChildOfClass("UICorner") or Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = button
    local stroke = button:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.78
    stroke.Thickness = 1
    stroke.Parent = button
    local original = button.BackgroundColor3
    local function animate(color)
        TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = color}):Play()
    end
    button.MouseEnter:Connect(function() animate(original:Lerp(Color3.new(1,1,1), 0.13)) end)
    button.MouseLeave:Connect(function() animate(original) end)
    button.Activated:Connect(function()
        animate(original:Lerp(Color3.new(0,0,0), 0.12))
        task.delay(0.12, function()
            if button.Parent then animate(original) end
        end)
    end)
end

for _, descendant in playerGui:GetDescendants() do polish(descendant) end
playerGui.DescendantAdded:Connect(polish)
