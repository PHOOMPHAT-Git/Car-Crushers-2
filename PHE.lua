local player = game.Players.LocalPlayer
if not player then
    return
end

local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then
    return
end

local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then
    return
end

local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")

Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

while humanoid.Health > 0 do
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Z, false, game)
    wait(0.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Z, false, game)

    if not humanoid.Sit then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, game)
        wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.R, false, game)
    end

    if humanoid.Sit then
        local car = game.Workspace.CarCollection:FindFirstChild(player.Name)
        if car then
            while humanoid.Sit and humanoid.Health > 0 do
                if car.PrimaryPart then
                    car:SetPrimaryPartCFrame(CFrame.new(-237.85083, 57.0881844, 245.69104, 0.744154632, 5.66782177e-09, -0.668007374, 5.95475536e-09, 1, 1.51182178e-08, 0.668007374, -1.52281121e-08, 0.744154632))
                    wait(0.1)
                    car:SetPrimaryPartCFrame(CFrame.new(humanoidRootPart.Position))
                    wait(0.1)
                    car:SetPrimaryPartCFrame(CFrame.new(humanoidRootPart.Position))
                    wait(0.1)
                    car:SetPrimaryPartCFrame(CFrame.new(humanoidRootPart.Position))
                end
                wait(0.1)
            end
        end
    end

    wait(1)
    character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:FindFirstChildOfClass("Humanoid")
    humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
end
