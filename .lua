local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - BETA")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Upgrade")
local T3 = wndw:Tab("Chest & Item")
local workspace = game:GetService("Workspace")
local client = game.Players.LocalPlayer

T1:Slider("Attack cooldown",0,5,2,function(value)
      _G.cda = tonumber(value)
end)

T1:Toggle("Auto attack",false,function(value)
   _G.Attack = value
    while wait(_G.cda) do
      if _G.Attack == false then break end
      game:GetService("ReplicatedStorage")["Events"]["AttackEvent"]:FireServer()
    end
end)

T1:Toggle("Auto claim mission",false,function(value)
   _G.cm = value
    while wait(_G.cda) do
      if _G.cm == false then break end
      game:GetService("ReplicatedStorage")["Events"]["CompletedDailyQuestsEvent"]:FireServer()
      game:GetService("ReplicatedStorage")["Events"]["DailyQuestsEvent"]:FireServer(true)
    end
end)

T1:Toggle("Auto upgrade rarity",false,function(value)
   _G.upgrarerity = value
    while wait(_G.cda) do
      if _G.upgrarerity == false then break end
      game:GetService("ReplicatedStorage")["Events"]["UpgradeRarityEvent"]:FireServer()
    end
end)

T1:Toggle("Auto gold rebirth",false,function(value)
   _G.agr = value
    while wait(_G.cda) do
      if _G.agr == false then break end
      game:GetService("ReplicatedStorage")["Events"]["getGoldenRebEvent"]:FireServer()
    end
end)

T1:Button("Rebirth area",function()
      workspace:FindFirstChild("Teleport Gui [FE]5")["ScriptTeleportRebirth"]["RemoteFunction"]:InvokeServer()
end)

T2:Dropdown("Select upgraded",{"DmgLevel","HpLevel"},function(value)
      _G.upgtype = value
end)

T2:Toggle("Auto upgrade",false,function(value)
   _G.aupg = value
    while wait() do
      if _G.aupg == false then break end
      game:GetService("ReplicatedStorage")["Events"]["UpgradeStatEvent"]:FireServer(_G.upgtype,0)
    end
end)

T3:Dropdown("Select chest",{"Guardian Boar Chest","Scorpion Chest","All chest coming soon"},function(value)
      _G.ctype = value
end)

T3:Toggle("Auto open chest",false,function(value)
   _G.aoc = value
    while wait() do
      if _G.aoc == false then break end
      game:GetService("ReplicatedStorage")["Events"]["UseItemEvent"]:FireServer(_G.ctype)
    end
end)

--[[lib:HookCalled(function(self,args)
     if self == "UpdateStatEvent" and args[1] == "giftDailyTimeLeft" then
         args[2] = 0
    elseif self == "SetExpTextEvent" and args[1] == client then
         args[2] = 9e9
    end
end)
]]
