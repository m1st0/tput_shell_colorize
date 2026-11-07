<!--
SPDX-FileCopyrightText: Copyright (c) 2017–2026 Maulik Mistry
SPDX-License-Identifier: Apache-2.0
-->
# tput_shell_colorize

A small, dependency-free shell utility for consistent terminal message formatting and color output in POSIX-compatible shell scripts, including Bash and Zsh.

Copyright © 2017–2026 Maulik Mistry

This project is licensed under Apache License 2.0. See the [LICENSE.txt](LICENSE.txt) file for details.

Please share support: 
- [PayPal](https://www.paypal.com/paypalme/m1st0)
- [Venmo](https://venmo.com/code?user_id=3319592654995456106&created=1753283702)

## Features

- Uses `tput` for terminal-aware color output
- Gracefully falls back to uncolored output when `tput`, terminal capabilities, or a TTY are unavailable such as redirecting output
- Works with Bash, Zsh, and POSIX `sh`
- Provides simple message formatting functions
- Provides semantic color names that follow your terminal theme
- Uses `printf` for predictable shell output
- No external library dependencies

## Setup and Usage

Source the utility from your shell script:

  ```bash
  . path/to/tput_shell_colorize.sh
  ```

For example, if installed as the recommended submodule shown below:

  ```bash
  . vendor/tput_shell_colorize/tput_shell_colorize.sh
  ```

Then use the provided functions. Messages automatically produce a complete line. When color is unavailable, the same messages are printed without color.

## Git Submodule Setup

- If desired as a submodule:

    ```bash
    git submodule add https://github.com/m1st0/tput_shell_colorize.git vendor/tput_shell_colorize
    git add .gitmodules vendor/tput_shell_colorize
    ```

    Commit as necessary.

- If cloning a project that uses this repo as a submodule:

    ```bash
    git clone --recurse-submodules <parent repository>
    ```

- If the project was already cloned without its submodules in the parent repo:

    ```bash
    git submodule update --init --recursive
    ```

## Functions

### messenger_std

Prints a standard message using the configured standard message color.

  ```bash
  messenger_std "Checking for updates..."
  ```

### messenger_std_inline

Prints a standard message in the same color as `messenger_std`, without ending the line. Useful for prompts.

  ```bash
  messenger_std_inline "Continue? "
  ```

### messenger_end

Prints an ending or completion message using the configured ending color.

  ```bash
  messenger_end "Update complete."
  ```

### linefeed

Prints a blank line.

  ```bash
  linefeed
  ```

## Colors

The color names `RED`, `GREEN`, `YELLOW`, `BLUE`, `MAGENTA`, `CYAN`, `WHITE`, and `BLACK` are terminal palette slots 0 to 7, not guaranteed hues. Many terminal themes remap them, so `RED` may not look red. `BOLD` and `RESET` are also available.

Prefer the semantic names, which describe what a color means and follow whatever your theme does with the slot:

| Name | Palette slot | Use for |
| --- | --- | --- |
| `COLOR_SUCCESS` | 2 | completed work |
| `COLOR_WARNING` | 3 | cautions and standard notices |
| `COLOR_ERROR` | 1 | failures |
| `COLOR_INFO` | 6 | neutral information |
| `COLOR_RESET` | | return to normal text |

  ```bash
  printf '%s%s%s\n' "$COLOR_SUCCESS" "Done" "$COLOR_RESET"
  ```

All of these are empty strings when color is unavailable, so the same line prints without color. See [Example Colors](#example-colors) for how one terminal theme renders these slots.

## Example Colors

| Name | Palette slot | Theme color | Hex | Swatch |
| --- | --- | --- | --- | --- |
| `BLACK` | 0 | Steel blue | `#194E7D` | ![Steel blue swatch](svg/swatch-black.svg) |
| `RED` / `COLOR_ERROR` | 1 | Olive/gold | `#8F8238` | ![Olive/gold swatch](svg/swatch-red.svg) |
| `GREEN` / `COLOR_SUCCESS` | 2 | Taupe | `#8A825E` | ![Taupe swatch](svg/swatch-green.svg) |
| `YELLOW` / `COLOR_WARNING` | 3 | Lavender | `#6F6FBA` | ![Lavender swatch](svg/swatch-yellow.svg) |
| `BLUE` | 4 | Blue | `#2C46AD` | ![Blue swatch](svg/swatch-blue.svg) |
| `MAGENTA` | 5 | Purple | `#4444CD` | ![Purple swatch](svg/swatch-magenta.svg) |
| `CYAN` / `COLOR_INFO` | 6 | Dark blue | `#00328E` | ![Dark blue swatch](svg/swatch-cyan.svg) |
| `WHITE` | 7 | Mustard | `#BBBB00` | ![Mustard swatch](svg/swatch-white.svg) |

## Requirements

- POSIX-compatible shell
- tput for colored terminal output
- terminfo terminal definitions for color support
