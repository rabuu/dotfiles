import XMonad
import XMonad.Config.Xfce
import XMonad.Util.EZConfig (additionalKeysP)

main = xmonad $ xfceConfig
    { terminal    = "alacritty"
    , modMask     = mod4Mask
    , normalBorderColor = "#bbbbbb"
    , focusedBorderColor = "#cc33dd"
    }
    `additionalKeysP`
    [ ("M-S-b", spawn "firefox")
    , ("M-p", spawn "rofi -show drun")
    , ("M-r", spawn "rofi -show run")
    , ("M-C-p", spawn "rofi -show powermenu")
    , ("M-S-p", spawn "passrofi")
    ]
