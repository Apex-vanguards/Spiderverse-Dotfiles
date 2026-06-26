-- ╔══════════════════════════════════════════════════════════════╗
-- ║   HYPRLAND LUA CONFIG — SINGLE MONITOR (eDP-1)              ║
-- ╚══════════════════════════════════════════════════════════════╝

------------------
---- MONITOR  ----
------------------
hl.monitor({ output = "eDP-1", mode = "1920x1080@60.056", position = "0x0", scale = "1" })

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd('bash -c "killall -e xdg-desktop-portal-hyprland; killall -e xdg-desktop-portal-gtk; killall -e xdg-desktop-portal; /usr/lib/xdg-desktop-portal-hyprland & sleep 2; /usr/lib/xdg-desktop-portal &"')
    hl.exec_cmd("waybar &")
    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("nm-applet &")
    hl.exec_cmd("blueman-applet &")
    hl.exec_cmd("swaybg -m fill -i /home/mrcat/Pictures/wallpapers/MainWallpaper.jpg &")
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    input = { kb_layout = "us", follow_mouse = 1 },
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,
        col = {
            active_border = "rgba(384551ff)",
            inactive_border = "rgba(1e293b44)",
        },
        layout = "dwindle",
        resize_on_border = true,
    },
    decoration = {
        rounding = 0,
        blur = { enabled = true, size = 8, passes = 4, vibrancy = 0.2, brightness = 0.7, ignore_opacity = true, new_optimizations = true },
        shadow = { enabled = true, range = 15, render_power = 4, color = "rgba(00000055)" },
    },
    dwindle = { preserve_split = true },
    misc = { force_default_wallpaper = 0, disable_hyprland_logo = true },
})

-------------------
---- ANIMATIONS ----
--------------------
hl.curve("macos", { type = "bezier", points = { { 0.2, 0.9 }, { 0.3, 1.05 } } })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "macos", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "macos", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "macos", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "macos", style = "slidefade" })

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waybar &"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("killall waybar"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("mpv --no-video ~/.config/hypr/spider-man-customized-web-thwip-sound-effect-1_ybmate.mp3 & wofi --show drun"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("code"))

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/ss.sh area"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("~/.config/hypr/ss.sh"))

-- Focus & Workspaces
for i = 1, 10 do
    local key = (i == 10) and "0" or tostring(i)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Directional Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-------------------------
----  WINDOW RULES  -----
-------------------------
hl.window_rule({ name = "volume-float", match = { title = "Volume Control" }, float = true })
hl.window_rule({ name = "alacritty-opacity", match = { class = "Alacritty" }, opacity = "0.92 0.85" })
hl.window_rule({ name = "code-opacity", match = { class = "code" }, opacity = "0.75 0.75" })
