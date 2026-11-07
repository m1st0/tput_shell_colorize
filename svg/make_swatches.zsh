#!/usr/bin/env zsh
# SPDX-FileCopyrightText: Copyright (c) 2017-2026 Maulik Mistry
# SPDX-License-Identifier: Apache-2.0
#
# Author: Maulik Mistry
# Please share support: https://www.paypal.com/paypalme/m1st0
#                       https://venmo.com/code?user_id=3319592654995456106&created=1753283702
#
# make_swatches.zsh - writes one SVG color swatch per palette slot next to this
# script and prints the README table that shows them.
#
# 1. Edit the hex colors below to match your terminal theme (Normal column).
# 2. Run:  zsh svg/make_swatches.zsh
# 3. Paste the printed table into the README under "Example Colors".
#
# Line format:  file | slot | hex | theme color name | semantic name (optional)
setopt NO_UNSET PIPE_FAIL

dir="${0:A:h}"

typeset -a swatches=(
    'black|0|#194E7D|Steel blue|'
    'red|1|#8F8238|Olive/gold|COLOR_ERROR'
    'green|2|#8A825E|Taupe|COLOR_SUCCESS'
    'yellow|3|#6F6FBA|Lavender|COLOR_WARNING'
    'blue|4|#2C46AD|Blue|'
    'magenta|5|#4444CD|Purple|'
    'cyan|6|#00328E|Dark blue|COLOR_INFO'
    'white|7|#BBBB00|Mustard|'
)

typeset line file slot hex theme sem name
integer bad=0

# Validate everything first so nothing is written with a bad color.
for line in "${swatches[@]}"; do
    IFS='|' read -r file slot hex theme sem <<< "$line"
    if [[ ! "$hex" =~ '^#[0-9A-Fa-f]{6}$' ]]; then
        print -u2 -r -- "Edit the hex for $file (slot $slot): \"$hex\" is not a color like #A1B2C3"
        bad=1
    fi
done
if (( bad )); then
    print -u2 -r -- "No files written."
    exit 1
fi

for line in "${swatches[@]}"; do
    IFS='|' read -r file slot hex theme sem <<< "$line"
    cat > "$dir/swatch-$file.svg" <<SVG
<!-- SPDX-FileCopyrightText: Copyright (c) 2017-2026 Maulik Mistry -->
<!-- SPDX-License-Identifier: Apache-2.0 -->
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" role="img" aria-label="$theme $hex">
  <title>$theme $hex</title>
  <rect x="1" y="1" width="22" height="22" rx="4" fill="$hex" stroke="#808080" stroke-width="1"/>
</svg>
SVG
done

print -r -- '| Name | Palette slot | Theme color | Hex | Swatch |'
print -r -- '| --- | --- | --- | --- | --- |'
for line in "${swatches[@]}"; do
    IFS='|' read -r file slot hex theme sem <<< "$line"
    name="\`${(U)file}\`"
    [[ -n "$sem" ]] && name+=" / \`$sem\`"
    printf '| %s | %s | %s | `%s` | ![%s swatch](svg/swatch-%s.svg) |\n' \
        "$name" "$slot" "$theme" "$hex" "$theme" "$file"
done
