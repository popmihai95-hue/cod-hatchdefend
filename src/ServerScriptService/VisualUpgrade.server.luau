-- HatchDefend 2.0 - optional visual enhancement.
-- Place in ServerScriptService. Disable or remove to restore the original lighting.
local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = true
Lighting.Brightness = 2.5
Lighting.ClockTime = 14.5
Lighting.ExposureCompensation = 0.05
Lighting.EnvironmentDiffuseScale = 0.45
Lighting.EnvironmentSpecularScale = 0.65
Lighting.ShadowSoftness = 0.35

local function effect(className, name, properties)
    local instance = Lighting:FindFirstChild(name)
    if instance and not instance:IsA(className) then
        warn("[HatchDefend] Conflicting lighting instance: " .. name)
        return
    end
    if not instance then
        instance = Instance.new(className)
        instance.Name = name
        instance.Parent = Lighting
    end
    for property, value in pairs(properties) do
        instance[property] = value
    end
end

effect("Atmosphere", "HD_Atmosphere", {
    Density = 0.28,
    Offset = 0.12,
    Color = Color3.fromRGB(200, 222, 255),
    Decay = Color3.fromRGB(120, 160, 210),
    Glare = 0.12,
    Haze = 1.2,
})
effect("BloomEffect", "HD_Bloom", {
    Intensity = 0.18,
    Size = 24,
    Threshold = 1.3,
})
effect("ColorCorrectionEffect", "HD_ColorGrade", {
    Brightness = 0.015,
    Contrast = 0.12,
    Saturation = 0.10,
    TintColor = Color3.fromRGB(255, 248, 240),
})
effect("SunRaysEffect", "HD_SunRays", {
    Intensity = 0.045,
    Spread = 0.75,
})
print("[HatchDefend] Visual upgrade enabled")
