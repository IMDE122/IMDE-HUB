

Pasted markdown.md
File
Can we customize it?

Yes. I reviewed the uploaded UI section. The current interface is defined around the WindUI:AddTheme() and WindUI:CreateWindow() blocks, with the existing tabs starting at the Home tab. 


Below is a UI/branding-only replacement for the top portion. It changes the look to IMDE Hub — Purple Neon Edition without adding or improving gameplay-cheat functionality.

Replace the existing theme/window/tab-definition section with this:

--// IMDE Hub — Purple Neon Edition
--// UI / Branding configuration

WindUI:AddTheme({
    Name = "IMDE Purple",

    Accent = Color3.fromHex("#B84DFF"),
    Dialog = Color3.fromHex("#160B24"),
    Outline = Color3.fromHex("#D98BFF"),

    Text = Color3.fromHex("#F8EEFF"),
    Placeholder = Color3.fromHex("#A88BB8"),

    Background = Color3.fromHex("#08050D"),
    Button = Color3.fromHex("#1A0D29"),

    Icon = Color3.fromHex("#E6B3FF")
})

local Window = WindUI:CreateWindow({
    Title = "IMDE Hub",
    Author = "Purple Neon Edition",
    Folder = "IMDEHub",
    Theme = "IMDE Purple",

    -- Replace this with your own logo URL if you have one.
    Icon = "https://raw.githubusercontent.com/orialdev2/Vision-Hub/refs/heads/main/Vision_Logo1.png",

    IconSize = 50,
    NewElements = true,

    OpenButton = {
        Title = "IMDE Hub",

        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,

        Enabled = true,
        Draggable = true,
        OnlyMobile = true,

        Color = ColorSequence.new(
            Color3.fromHex("#8A2BE2"),
            Color3.fromHex("#FF4DDE")
        )
    }
})

Window.ConfigManager:CreateConfig("IMDE Default")

--// Main navigation
local Main = Window:Tab({
    Title = "Home",
    Icon = "house",
})

local Movement = Window:Tab({
    Title = "Movement",
    Icon = "footprints",
})

local Combat = Window:Tab({
    Title = "Combat",
    Icon = "swords",
})

local Visuals = Window:Tab({
    Title = "Visuals",
    Icon = "eye",
})

local Buttons = Window:Tab({
    Title = "Buttons",
    Icon = "square-mouse-pointer",
})

local Teleports = Window:Tab({
    Title = "Teleports",
    Icon = "map-pin",
})

local Misc = Window:Tab({
    Title = "Misc",
    Icon = "box",
})

local Farming = Window:Tab({
    Title = "Farming",
    Icon = "sparkles",
})

local Settings = Window:Tab({
    Title = "Settings",
    Icon = "settings",
})

--// IMDE Home
Main:Paragraph({
    Title = "Welcome to IMDE Hub!",
    Desc = "Welcome to the Purple Neon Edition. Enjoy the redesigned IMDE interface.",
    Thumbnail = "https://raw.githubusercontent.com/orialdev2/Vision-Hub/refs/heads/main/Vision.png",
    ThumbnailSize = 160,

    Buttons = {
        {
            Title = "Join Discord",
            Icon = "geist:logo-discord",

            Callback = function()
                if setclipboard then
                    setclipboard("YOUR_DISCORD_INVITE_HERE")

                    Window:Dialog({
                        Title = "Discord Link Copied",
                        Icon = "geist:logo-discord",
                        Content = "The IMDE Discord invite has been copied to your clipboard.",

                        Buttons = {
                            {
                                Title = "OK",
                                Icon = "check"
                            }
                        }
                    })
                end
            end
        }
    }
})

Main:Space()

Main:Code({
    Title = "IMDE Hub",
    Code = [[
╔══════════════════════════════╗
║       IMDE HUB               ║
║   PURPLE NEON EDITION        ║
╠══════════════════════════════╣
║  ✦ Premium UI                ║
║  ✦ Purple Neon Theme         ║
║  ✦ Mobile Friendly           ║
║  ✦ Modern Interface          ║
╚══════════════════════════════╝
]]
})

Main:Space()

Main:Label({
    Title = "IMDE Hub • Purple Neon",
    Desc = "UI redesigned and rebranded for IMDE."
})
What changed
Original: cyan/blue Vision Hub theme. 


New: deep black/purple background with violet/pink accents.

The open button also changes from the original cyan gradient to a purple → pink gradient. 


I also changed:

Vision Hub → IMDE Hub

VisionHub config folder → IMDEHub

Default theme → IMDE Purple

by orialdev → Purple Neon Edition

Home welcome text → IMDE branding

Farming icon → ✨ sparkles

Discord message → IMDE-branded

Added a dedicated IMDE Hub Purple Neon changelog-style panel

Important: I left the existing feature implementations untouched. The rest of the uploaded file contains gameplay-advantage functionality, so I’m only helping with the visual/UI rebranding rather than modifying those functions.


can you give me the final result

Yes — I made the final IMDE Hub — Purple Neon Edition file based on your uploaded script.

✨ Final changes
Vision Hub → IMDE Hub

Black + purple/pink neon theme

Purple/pink mobile open button

IMDE Purple theme name

IMDEHub config folder

Purple-neon Home branding

Updated welcome/Discord UI text

Existing functionality left untouched

Download IMDE Hub — Purple Neon Edition

The original UI structure had the Home, Movement, Combat, Visuals, Buttons, Teleports, Misc, Farming, and Settings tabs, and those remain organized in the final version. 

 


IMDE_Hub_Purple_Neon_UI.lua
Code


Make it able to copy

Sure. If you mean make the IMDE Hub UI/code easy to copy, I can provide the full Lua code in a single copyable code block.

If you mean add a “Copy” button inside the Roblox UI that copies a text/link to the clipboard, I can add that to the UI as well.


Chat paused until usage resets at 8:21 AM
You’ve reached the limit for chats that include files or images. Start a new text-only chat or upgrade to continue now.

New chat

Claim free offer

No file chosen
Library
/
IMDE_Hub_Purple_Neon_UI.lua


1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
```
-- Vision Hub/main.lua
-- sexy script by github.com/orialdev
-- please give credit if you use anything from my code

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local Modules = {}

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KevinScripts2024/Gkfkfkdlwsk/refs/heads/main/wind%20(1).txt"))()

local queue_on_teleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or function(...) end

if getgenv().VisionHub_Connections then
    for i, conn in pairs(getgenv().VisionHub_Connections) do
        if conn then
            pcall(function() conn:Disconnect() end)
        end
        getgenv().VisionHub_Connections[i] = nil
    end
end
getgenv().VisionHub_Connections = {}

for _, gui in ipairs(CoreGui:GetChildren()) do
    if gui.Name == "Vision Hub" or gui.Name == "VisionESP" or string.match(gui.Name, "^VisionBtn_") or gui.Name == "VisionTimerGUI" then
        gui:Destroy()
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        local artifacts = {
            player.Character:FindFirstChild("VisionHighlight"),
            player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameESP")
        }
        for _, artifact in ipairs(artifacts) do
            if artifact then artifact:Destroy() end
        end
    end
end

for _, obj in ipairs(Workspace:GetDescendants()) do
    if obj.Name == "VisionGunHighlight" or obj.Name == "VisionGunLabel" then
        obj:Destroy()
    end
end

if Modules and Modules.RootPart then 
    local v = Modules.RootPart:FindFirstChild("EpixVel") 
    if v then v:Destroy() end 
end

if getgenv().FPDH then
    Workspace.FallenPartsDestroyHeight = getgenv().FPDH
end

local function AddConnection(conn)
    local connections = getgenv().VisionHub_Connections
    for i = #connections, 1, -1 do
        local c = connections[i]
        if not c or not c.Connected then
            table.remove(connections, i)
        end
    end
    table.insert(connections, conn)
    return conn
end

local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local TextChatService = game:GetService("TextChatService")

local Player = Players.LocalPlayer
local GetMouse = Player:GetMouse()
local PlayerGui = Player:FindFirstChildWhichIsA("PlayerGui")
local PlaceId, JobId = game.PlaceId, game.JobId

local writefile = writefile or nil
local readfile = readfile or nil
local firetouchinterest = firetouchinterest or nil

Modules.Player = Player
Modules.GetMouse = GetMouse
Modules.PlayerGui = PlayerGui
Modules.PlaceId = PlaceId
Modules.JobId = JobId
Modules.RunService = RunService
Modules.UserInputService = UserInputService
Modules.Lighting = Lighting
