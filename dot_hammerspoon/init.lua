-- Reference Hammerspoon
hs = hs

local spoonDir = os.getenv("HOME") .. "/.hammerspoon/Spoons"
local spoonInstallPath = spoonDir .. "/SpoonInstall.spoon"
local spoonZipPath = spoonInstallPath .. ".zip"
local url = "https://raw.githubusercontent.com/Hammerspoon/Spoons/master/Spoons/SpoonInstall.spoon.zip"

-- Ensure the directory exists before writing
if not hs.fs.attributes(spoonDir) then
    hs.fs.mkdir(spoonDir)
end

-- Check if SpoonInstall.spoon exists
if not hs.fs.attributes(spoonInstallPath) then
    -- Download the ZIP
    local status, body = hs.http.get(url, nil)
    if status == 200 then
        -- Save the zip
        local file = io.open(spoonZipPath, "wb")
        if file then
            file:write(body)
            file:close()

            -- Unzip (requires system 'unzip' command)
            hs.task.new("/usr/bin/unzip", function(exitCode, stdOut, stdErr)
                if exitCode == 0 then
                    hs.fs.remove(spoonZipPath)
                    hs.alert.show("SpoonInstall downloaded and installed.")
                else
                    hs.alert.show("Unzip failed: " .. stdErr)
                end
            end, {spoonZipPath, "-d", spoonDir}):start()
        else
            hs.alert.show("Failed to open file for writing: " .. spoonZipPath)
        end
    else
        hs.alert.show("Failed to download SpoonInstall: HTTP " .. tostring(status))
    end
end


-- Load SpoonInstall
hs.loadSpoon("SpoonInstall")

--------------------------------------------------------------------------------
-- Application Launcher
--------------------------------------------------------------------------------

function bindAppLaunch(mods, key, appName)
	hs.hotkey.bind(mods, key, function()
		hs.application.launchOrFocus(appName)
	end)
end

bindAppLaunch({ "cmd" }, "1", "WezTerm")
bindAppLaunch({ "cmd" }, "2", "Intellij IDEA")
bindAppLaunch({ "cmd" }, "3", "Google Chrome")
-- bindAppLaunch({ "cmd" }, "4", "ChatGpt")
bindAppLaunch({ "cmd" }, "5", "dbeaver")
bindAppLaunch({ "cmd" }, "6", "Postman")
-- bindAppLaunch({ "cmd" }, "7", "pycharm ce")
bindAppLaunch({ "cmd" }, "7", "antigravity")
-- bindAppLaunch({ "cmd" }, "7", "visual studio code")
bindAppLaunch({ "cmd" }, "9", "Slack")

-- Reopen Finder
hs.hotkey.bind({ "cmd" }, "0", function()
	hs.osascript.applescript('tell application "Finder" to reopen activate')
end)


--------------------------------------------------------------------------------
-- Window Management
--------------------------------------------------------------------------------

spoon.SpoonInstall:andUse("WindowHalfsAndThirds", {
	hotkeys = {
		left_half =    { { "ctrl", "cmd" }, "Left" },
		right_half =   { { "ctrl", "cmd" }, "Right" },
		top_half =     { { "ctrl", "cmd" }, "Up" },
		bottom_half =  { { "ctrl", "cmd" }, "Down" },
		max_toggle =   { { "ctrl", "cmd" }, "F" },
	},
})

--------------------------------------------------------------------------------
-- Toggle Dark Mode
--------------------------------------------------------------------------------

hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "d", function()
	hs.osascript.applescript([[
        tell application "System Events" to tell appearance preferences to set dark mode to not dark mode
    ]])
end)

--------------------------------------------------------------------------------
-- Auto-reload Config on Change
--------------------------------------------------------------------------------

spoon.SpoonInstall:andUse("ReloadConfiguration", {
	config = {
		watch_paths = { hs.configdir },
	},
	start = true,
})


-- Function to quit WhatsApp
local function quitWhatsApp()
    hs.application.get("WhatsApp"):kill()
end

-- Trigger on system will sleep or screen locked
local sleepWatcher = hs.caffeinate.watcher.new(function(event)
    if event == hs.caffeinate.watcher.systemWillSleep
        -- or event == hs.caffeinate.watcher.screensDidLock
        -- or event == hs.caffeinate.watcher.sessionDidResignActive
        then
        quitWhatsApp()
    end
end)

sleepWatcher:start()

--------------------------------------------------------------------------------
-- Final Notification
--------------------------------------------------------------------------------

hs.alert.show("Hammerspoon config loaded!")
