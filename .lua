local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - BETA")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Upgrade")
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

--[[lib:HookCalled(function(self,args)
     if self == "UpdateStatEvent" and args[1] == "giftDailyTimeLeft" then
         args[2] = 0
    elseif self == "SetExpTextEvent" and args[1] == client then
         args[2] = 9e9
    end
end)
]]
