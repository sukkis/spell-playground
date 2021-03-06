import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.WorkspaceNames
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Cursor
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86                -- allows referring to extra keys with convenience names

main = xmonad . myConfig =<< spawnPipe "xmobar"

myConfig pipe = defaultConfig {
    startupHook = startup,
    manageHook = myManageHook,
    layoutHook = smartBorders . avoidStruts $ layoutHook defaultConfig, -- smartBorders removes borders from full screen app
    handleEventHook = docksEventHook <+> handleEventHook defaultConfig,
    logHook = myLogHook pipe,
    terminal = "urxvt",
    workspaces = myWorkSpaces,
    modMask = mod4Mask -- Mod to Windows key
    } `additionalKeys` myShortCuts

-- Workspace names
myWorkSpaces = ["1-urxvt","2-code","3-firefox","4-container","5-viewer","6-spotify","7-messaging","8-keepassx","9-minimize"]

-- Make workspace names visible in Xmobar
myLogHook pipe = workspaceNamesPP xmobarPP {
    ppOutput = hPutStrLn pipe,
    ppTitle  = xmobarColor "Red" "" . shorten 50}
    >>= dynamicLogWithPP 


-- Define ManageHooks. With composeAll you can combine options, like in "= manageDocks <+> manageHook defaultConfig"
myManageHook = composeAll [
    manageDocks,
    className =? "Firefox" --> doShift ("3-firefox"),    -- always open Firefox in third workspace
    className =? "Spotify" --> doShift ("6-spotify"),    -- always open Spotify in 6th workspace
    isFullscreen --> doFullFloat,
    className =? "Vlc" --> doFloat,                       -- run Vlc media player as a floating app
    className =? "Steam" --> doFloat,
    manageHook defaultConfig
    ]

-- Define keyboard shortcuts
myShortCuts = [
    ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
    ((mod4Mask .|. shiftMask, xK_e), spawn "emacs"),
    ((mod4Mask .|. shiftMask, xK_f), spawn "firefox"),
    ((mod4Mask .|. shiftMask, xK_s), spawn "spotify"),
    ((mod4Mask .|. shiftMask, xK_t), sendMessage ToggleStruts),           -- toggle Xmobar visible/hidden
    ((controlMask, xK_Print       ), spawn "sleep 0.2; scrot -s"),        -- print screen with resizable picture area
    ((0  ,         xK_Print       ), spawn "scrot" ),                     -- regular print screen
    ((0  , xF86XK_AudioLowerVolume), spawn "amixer -q sset Master 2%-"),  -- lower volume
    ((0  , xF86XK_AudioRaiseVolume), spawn "amixer -q sset Master 2%+"),  -- raise volume
    ((0  , xF86XK_AudioMute       ), spawn "amixer set Master toggle")    -- mute
    ]

-- On starting Xmonad
startup :: X ()
startup = do
    spawn "feh --bg-fill ~/Pictures/wallpapers/miami.jpg &"
    setDefaultCursor xC_pirate
