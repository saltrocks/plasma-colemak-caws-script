#!/bin/bash -e

kwriteconfig6 --file kxkbrc --group Layout --key Model "pc104awide"
kwriteconfig6 --file kxkbrc --group Layout --key LayoutList "us(cmk_ed_us)"
kwriteconfig6 --file kxkbrc --group Layout --key Options "grp:shifts_toggle,misc:cmk_curl_dh,caps:escape,misc:sym_wide-104"
dbus-send --session --type=signal --reply-timeout=100 --dest=org.kde.keyboard /Layouts org.kde.keyboard.reloadConfig
