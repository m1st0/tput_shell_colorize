# SPDX-FileCopyrightText: Copyright (c) 2017-2026 Maulik Mistry
# SPDX-License-Identifier: Apache-2.0
#
# tput_shell_colorize.sh - POSIX compliant source to print shell colored responses.
#
# Author: Maulik Mistry
# Please share support: https://www.paypal.com/paypalme/m1st0
#                       https://venmo.com/code?user_id=3319592654995456106&created=1753283702
#
# Color names (RED, GREEN, ...) are ANSI palette slots 0-7, not guaranteed hues:
# many terminal themes remap them. Scripts should prefer the semantic names,
# which say what a color means and follow whatever the theme does with the slot:
#   COLOR_SUCCESS (slot 2)  COLOR_WARNING (slot 3)  COLOR_ERROR (slot 1)
#   COLOR_INFO    (slot 6)  COLOR_RESET
# See the README, "Example Colors", for one theme's values.

# Fallback
RESET=''
BOLD=''
BLACK=''
RED=''
GREEN=''
YELLOW=''
BLUE=''
MAGENTA=''
CYAN=''
WHITE=''
COLOR_SUCCESS=''
COLOR_WARNING=''
COLOR_ERROR=''
COLOR_INFO=''
COLOR_RESET=''

# If tput is available and TERM is set properly.
if [ -t 1 ] && command -v tput >/dev/null 2>&1; then
    RESET="$(tput sgr0 2>/dev/null)"
    BOLD="$(tput bold 2>/dev/null)"
    BLACK="$(tput setaf 0 2>/dev/null)"
    RED="$(tput setaf 1 2>/dev/null)"
    GREEN="$(tput setaf 2 2>/dev/null)"
    YELLOW="$(tput setaf 3 2>/dev/null)"
    BLUE="$(tput setaf 4 2>/dev/null)"
    MAGENTA="$(tput setaf 5 2>/dev/null)"
    CYAN="$(tput setaf 6 2>/dev/null)"
    WHITE="$(tput setaf 7 2>/dev/null)"

    # Semantic names, derived from the slots above so there is one source.
    COLOR_SUCCESS="$GREEN"
    COLOR_WARNING="$YELLOW"
    COLOR_ERROR="$RED"
    COLOR_INFO="$CYAN"
    COLOR_RESET="$RESET"
fi

linefeed() {
  printf '\r\n'
}

messenger_std() {
    printf '%s%s%s\n' "$YELLOW" "$*" "$RESET"
}

messenger_std_inline() {
    printf '%s%s%s' "$YELLOW" "$*" "$RESET"
}

messenger_end() {
    printf '%s%s%s\n' "$RED" "$*" "$RESET"
}
