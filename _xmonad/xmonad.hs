-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)
import XMonad.Util.Run(spawnPipe)

import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.UrgencyHook

import System.IO

-- main = do
--      xmproc <- spawnPipe "/home/arjend/.cabal/bin/xmobar /home/jgoerzen/.xmobarrc"
--      session <- getEnv "DESKTOP_SESSION"
--      xmonad  $ maybe desktopConfig desktop session
-- main = do
--     xmproc <- spawnPipe "/home/arjend/.cabal/bin/xmobar /home/jgoerzen/.xmobarrc"
--     session <- getEnv "DESKTOP_SESSION"
--     xmonad $ defaultConfig
--         { manageHook = manageDocks <+> manageHook defaultConfig
--         , layoutHook = avoidStruts  $  layoutHook defaultConfig
--         , modMask = mod4Mask     -- Rebind Mod to the Windows key
--         } `additionalKeys`
--         [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
--         , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
--         , ((0, xK_Print), spawn "scrot")
--         ]
main = do
    xmproc <- spawnPipe "/home/arjend/.cabal/bin/xmobar /home/arjend/.xmobarrc"
    -- spawnPipe "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype percent --width 5 --transparent true --tint 0x000000 --height 12&"
    -- -- spawnPipe "mate-volume-control-applet"
    -- spawnPipe "feh --bg-fill wallpapers/23616853.jpg"
    spawn "sh ~/.xmonad/startup.sh"

    xmonad $ defaultConfig
        { terminal = "terminator"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((mod4Mask .|. shiftMask, xK_r), spawn "scrot")
        ]

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-mate" = gnomeConfig
desktop _ = desktopConfig
