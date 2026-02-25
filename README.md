# plasma-colemak-caws-script

Shell script to switch KDE Plasma 6 to the Colemak keyboard layout with CAWS (Curl, Angle, Wide, Symbol) mods.

## Requirements

- KDE Plasma 6
- [BigBagKbdTrixXKB](https://github.com/DreymaR/BigBagKbdTrixXKB) installed
- `kwriteconfig6`, `dbus-send`

## Usage

```sh
chmod +x colemak_kde_switch.sh
./colemak_kde_switch.sh
```

Override defaults:

```sh
./colemak_kde_switch.sh --model pc105awide --layout "us(cmk_ed_us)" --options "caps:escape"
```

| Flag | Default |
|---|---|
| `-m`, `--model` | `pc104awide` |
| `-l`, `--layout` | `us(cmk_ed_us)` |
| `-o`, `--options` | `grp:shifts_toggle,misc:cmk_curl_dh,caps:escape,misc:sym_wide-104` |

The layout is applied immediately via D-Bus without requiring a logout.

## License

BSD Zero Clause
