<#!/usr/bin/env bash
set -euo pipefail

MODEL="pc105awide"
LAYOUT="us(cmk_ed_us)"
OPTIONS="grp:shifts_toggle,misc:cmk_curl_dh,caps:escape,misc:sym_wide-104"

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Configure KDE Plasma 6 to use Colemak-CAWS keyboard layout (ISO + wide mod version).

Options:
  -m, --model MODEL      Keyboard model (default: $MODEL)
  -l, --layout LAYOUT    Layout string (default: $LAYOUT)
  -o, --options OPTIONS  XKB options (default: $OPTIONS)
  -h, --help             Show this help message
EOF
    exit 0
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -m|--model)  MODEL="$2";   shift 2 ;;
        -l|--layout) LAYOUT="$2";  shift 2 ;;
        -o|--options) OPTIONS="$2"; shift 2 ;;
        -h|--help)   usage ;;
        *)
            echo "Unknown option: $1" >&2
            usage
            ;;
    esac
done

for cmd in kwriteconfig6 dbus-send; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: '$cmd' not found. Is KDE Plasma 6 installed?" >&2
        exit 1
    fi
done

kwriteconfig6 --file kxkbrc --group Layout --key Model "$MODEL"
kwriteconfig6 --file kxkbrc --group Layout --key LayoutList "$LAYOUT"
kwriteconfig6 --file kxkbrc --group Layout --key Options "$OPTIONS"
dbus-send --session --type=signal --reply-timeout=100 --dest=org.kde.keyboard /Layouts org.kde.keyboard.reloadConfig
