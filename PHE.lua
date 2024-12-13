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

local isLooping = false

player.Chatted:Connect(function(message)
    if message == "!on" then
        isLooping = true
        print("Loop started.")
    elseif message == "!off" then
        isLooping = false
        print("Loop stopped.")
    end
end)

while true do
    if isLooping then
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
                while humanoid.Sit and isLooping do
                    if car.PrimaryPart then
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
    else
        wait(0.1)
    end
    wait(0.1)
end
