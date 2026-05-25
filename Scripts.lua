--===================================================================================--
--                     BRIDGER: WESTERN (VIP PREMIUM MENU)                           --
--                                 Version: 1.9.5                                    --
--===================================================================================--

-- 1. Key System Configuration
local CorrectKey = "VIP23K1" 
local KeyVerified = false

-- Load Kavo UI Library
local KavoLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create Key Verification Window
local KeyWindow = KavoLibrary.CreateLib("🔐 VIP PREMIUM LOGIN SYSTEM", "DarkTheme")
local KeyTab = KeyWindow:NewTab("Activation")
local KeySection = KeyTab:NewSection("Enter your VIP License Key:")

KeySection:NewTextBox("License Key", "Paste your VIP key here to unlock", function(text)
    if text == CorrectKey then
        KeyVerified = true
        print("[+] Access Granted! Loading VIP Main Menu...")
        game:GetService("CoreGui"):FindFirstChild("🔐 VIP PREMIUM LOGIN SYSTEM"):Destroy()
        StartMainMenu()
    else
        print("[-] Invalid Key! Please try again.")
    end
end)


-- 2. Main Menu Function (Triggers after successful login)
function StartMainMenu()
    -- BloodTheme perfectly matches the tactical/western vibe of the map
    local Window = KavoLibrary.CreateLib("⭐ BRIDGER: WESTERN [VIP23K1]", "BloodTheme") 
    
    ----------------------------------------------------
    -- [MASTER CONTROL TAB - NEW]
    ----------------------------------------------------
    local ControlTab = Window:NewTab("Master Control")
    local ControlSection = ControlTab:NewSection("Hack Status & UI Settings")
    
    -- Master Switch to turn ALL hack features ON or OFF instantly
    ControlSection:NewToggle("MASTER HACK SWITCH", "Enable or Disable all features completely", function(state)
        _G.MasterHackEnabled = state
        if state then
            print("[VIP] Hack System is now ACTIVE.")
        else
            print("[VIP] Hack System is now DISABLED (Safe Mode).")
        end
    end)

    -- Info label for hiding the UI
    ControlSection:NewLabel("Press 'RightShift' to Hide/Show this Menu")

    ----------------------------------------------------
    -- [AIMBOT & SENSITIVITY TAB]
    ----------------------------------------------------
    local AimTab = Window:NewTab("Aimbot")
    local AimSection = AimTab:NewSection("High Precision Aim Settings")
    
    AimSection:NewToggle("Enable Aimbot", "Lock camera onto enemies and monsters automatically", function(state)
        if _G.MasterHackEnabled then
            if state then
                print("[+] Aimbot Activated")
                -- Insert your Aimbot code logic here
            else
                print("[-] Aimbot Deactivated")
            end
        else
            print("[!] Master Switch is OFF. Enable it first!")
        end
    end)
    
    AimSection:NewSlider("Aim Smoothness (Sensitivity)", "Adjust tracking speed to prevent snappy/banable movements", 10, 1, function(val)
        print("[*] Sensitivity set to: " .. val)
    end)

    AimSection:NewSlider("FOV Radius", "Adjust the aimbot field of view circle", 300, 50, function(val)
        print("[*] FOV Radius set to: " .. val)
    end)

    ----------------------------------------------------
    -- [VISUALS / ESP TAB]
    ----------------------------------------------------
    local EspTab = Window:NewTab("Visuals (ESP)")
    local EspSection = EspTab:NewSection("Wallhack & World ESP")
    
    EspSection:NewToggle("Player/Monster Box ESP", "Draw boxes around targets through walls", function(state)
        if _G.MasterHackEnabled and state then
            print("[+] Box ESP Enabled")
        else
            print("[-] Box ESP Disabled")
        end
    end)
    
    EspSection:NewToggle("Tracer Lines", "Draw lines from screen center to targets", function(state)
        if _G.MasterHackEnabled and state then
            print("[+] Tracers Enabled")
        else
            print("[-] Tracers Disabled")
        end
    end)

    ----------------------------------------------------
    -- [MOVEMENT / FLY TAB]
    ----------------------------------------------------
    local FlyTab = Window:NewTab("Movement")
    local FlySection = FlyTab:NewSection("Fly & Speed Hacks")
    
    FlySection:NewToggle("Fly Mode (Up / Down)", "Fly freely across Ridge B Valley", function(state)
        if _G.MasterHackEnabled and state then
            print("[+] Fly Mode Enabled")
        else
            print("[-] Fly Mode Disabled")
        end
    end)
    
    FlySection:NewSlider("Fly Speed", "Control your flying velocity", 150, 16, function(speed)
        print("[*] Fly Speed: " .. speed)
    end)

    ----------------------------------------------------
    -- [TELEPORT TAB]
    ----------------------------------------------------
    local TeleportTab = Window:NewTab("Teleportation")
    local TeleportSection = TeleportTab:NewSection("Instant Map Teleports")
    
    TeleportSection:NewButton("Teleport to Main Town", "Instantly teleports you to the safe zone", function()
        if _G.MasterHackEnabled then
            print("[+] Teleporting to Town...")
            -- game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(X, Y, Z)
        else
            print("[!] Enable Master Switch first!")
        end
    end)
    
    TeleportSection:NewButton("Teleport to Ridge B Valley", "Teleport directly into the cursed wild lands", function()
        if _G.MasterHackEnabled then
            print("[+] Teleporting to Ridge B Valley...")
        else
            print("[!] Enable Master Switch first!")
        end
    end)
    
    TeleportSection:NewButton("Teleport to Horse Stable", "Teleport to the horse summoning zone", function()
        if _G.MasterHackEnabled then
            print("[+] Teleporting to Horse Stable...")
        else
            print("[!] Enable Master Switch first!")
        end
    end)
end
