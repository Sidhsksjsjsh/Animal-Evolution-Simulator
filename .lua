local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - BETA")
local T1 = wndw:Tab("Main")

T1:Toggle("Auto attack",false,function(value)
   _G.Attack = value
    while wait() do
      if _G.Attack == false then break end
      game:GetService("ReplicatedStorage")["Events"]["AttackEvent"]:FireServer()
    end
end)

lib:HookCalled(function(self,args)
     if self == "UpdateStatEvent" and args[1] == "giftDailyTimeLeft" then
      args[2] = 0
    end
end)
