# SPDX-FileCopyrightText: Copyright (c) 2017-2026 Maulik Mistry
# SPDX-License-Identifier: Apache-2.0
#
# tput_shell_colorize.sh - POSIX compliant source to print shell colored responses.
#
# Author: Maulik Mistry
# Please share support: https://www.paypal.com/paypalme/m1st0
#                       https://venmo.com/code?user_id=3319592654995456106&created=1753283702


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

