import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        manageHook = myManageHook,
        layoutHook = smartBorders . avoidStruts $ layoutHook defaultConfig, -- smartBorders removes borders from full screen app
        handleEventHook = docksEventHook <+> handleEventHook defaultConfig,
        logHook = dynamicLogWithPP xmobarPP
                       {
                       ppOutput = hPutStrLn xmproc,
                       ppTitle = xmobarColor "Green" "" . shorten 50
                       },
        terminal = "urxvt",
        workspaces = myWorkSpaces,
        modMask = mod4Mask -- Mod to Windows key
    } `additionalKeys` myShortCuts

-- Workspace names
myWorkSpaces = ["1-urxvt","2-code","3-firefox","4-urxvt","5-urxvt","6-urxvt","7-messaging","8-keepassx","9-minimize"]


-- Define ManageHooks. With composeAll you can combine options, like in "= manageDocks <+> manageHook defaultConfig"
myManageHook = composeAll [
    manageDocks,
    className =? "Firefox" --> doShift ("3-firefox"),    -- always open Firefox in third workspace
    isFullscreen --> doFullFloat,
    className =? "Vlc" --> doFloat,                       -- run Vlc media player as a floating app
    manageHook defaultConfig
    ]

-- Define keyboard shortcuts
myShortCuts = [
    ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
    ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"),   -- print screen with resizable picture area
    ((0, xK_Print), spawn "scrot"),                           -- regular print screen
    ((mod4Mask .|. shiftMask, xK_e), spawn "emacs"),
    ((mod4Mask .|. shiftMask, xK_f), spawn "firefox"),
    ((mod4Mask .|. shiftMask, xK_t), sendMessage ToggleStruts) -- toggle Xmobar visible/hidden
    ]
