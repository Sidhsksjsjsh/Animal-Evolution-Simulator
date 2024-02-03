local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - More bypass, more fun")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Upgrade")
local T3 = wndw:Tab("Chest & Item")
local T4 = wndw:Tab("Animal Changer")
local T5 = wndw:Tab("Leaderstats")

local workspace = game:GetService("Workspace")
local client = game.Players.LocalPlayer
local skinHandler = {}
local stats = T5:Label("Error label")
lib:AddTable(game:GetService("ReplicatedStorage")["AnimalsSkin"],skinHandler)
--[[
Players.Rivanda_Cheater.leaderstats.Rebirth
Players.Rivanda_Cheater.leaderstats.Xp
]]

local function getGoldRebirth()
   return client["leaderstats"]["G Rebirth"]["Value"]
end

local function getRebirth()
   return client["leaderstats"]["Rebirth"]["Value"]
end

local function getXP()
   return client["leaderstats"]["Xp"]["Value"]
end

local function getLevel()
   return client["leaderstats"]["Lv"]["Value"]
end

T1:Toggle("Auto attack",false,function(value)
   _G.Attack = value
    while wait(1.5) do
      if _G.Attack == false then break end
      game:GetService("ReplicatedStorage")["Events"]["AttackEvent"]:FireServer()
    end
end)

T1:Toggle("Instant mission",false,function(value)
   _G.cm = value
    while wait() do
      if _G.cm == false then break end
      game:GetService("ReplicatedStorage")["Events"]["CompletedDailyQuestsEvent"]:FireServer()
      game:GetService("ReplicatedStorage")["Events"]["DailyQuestsEvent"]:FireServer(true)
    end
end)

T1:Toggle("Auto upgrade rarity",false,function(value)
   _G.upgrarerity = value
    while wait() do
      if _G.upgrarerity == false then break end
      game:GetService("ReplicatedStorage")["Events"]["UpgradeRarityEvent"]:FireServer()
    end
end)

T1:Toggle("Auto gold rebirth",false,function(value)
   _G.agr = value
    while wait() do
      if _G.agr == false then break end
      game:GetService("ReplicatedStorage")["Events"]["getGoldenRebEvent"]:FireServer()
    end
end)

T1:Toggle("Auto rebirth",false,function(value)
   _G.rbrts = value
    while wait() do
      if _G.rbrts == false then break end
      game:GetService("ReplicatedStorage")["Events"]["RebirthEvent"]:FireServer()
    end
end)

--[[T1:Button("Instant collect apples",function()
      lib:FireTouch(workspace["Apple"]["HumanoidRootPart"])
end)
]]

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

T4:Dropdown("Select animals",skinHandler,function(value)
      _G.animaltype = value
end)

T4:Button("Change animal",function()
   game:GetService("ReplicatedStorage")["Events"]["ChangeRaceEvent"]:FireServer(_G.animaltype)
end)

while wait() do
   stats:EditLabel("[ Your leaderstats ]\nLevel: " .. getLevel() .. "\nGolden Rebirth: " .. getGoldRebirth() .. "\nRebirth: " .. getRebirth() .. "\nXP: " .. getXP())
end
