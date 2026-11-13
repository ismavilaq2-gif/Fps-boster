
--[[
    MMV + MM2 OPTIMIZER v1.0
    Delta Executor
    Sin interfaz / Sin Low Graphics
]]

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- CONFIGURACIÓN
local CONFIG = {
    OptimizeParticles = true,
    OptimizeShadows = true,
    OptimizeEffects = true,
}

-- OPTIMIZAR ILUMINACIÓN
if CONFIG.OptimizeShadows then
    Lighting.GlobalShadows = false
end

-- REDUCIR PARTÍCULAS
local function optimizeObject(obj)
    if CONFIG.OptimizeParticles then
        if obj:IsA("ParticleEmitter") then
            obj.Enabled = false
        elseif obj:IsA("Trail") or obj:IsA("Beam") then
            obj.Enabled = false
        end
    end

    if CONFIG.OptimizeEffects then
        if obj:IsA("BlurEffect")
        or obj:IsA("DepthOfFieldEffect")
        or obj:IsA("SunRaysEffect") then
            obj.Enabled = false
        end
    end
end

-- APLICAR A OBJETOS EXISTENTES
for _, obj in ipairs(Workspace:GetDescendants()) do
    optimizeObject(obj)
end

-- OPTIMIZAR OBJETOS NUEVOS
Workspace.DescendantAdded:Connect(optimizeObject)

print("[Optimizer] MMV + MM2 optimizados correctamente.")
