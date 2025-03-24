local drops_folder = workspace.Folder

for _, v in pairs(drops_folder:GetChildren()) do
    if v:IsA("Model") then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 10, 0)
        task.wait(0.5)
    end
end
