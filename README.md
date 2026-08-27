<!--
SPDX-FileCopyrightText: Copyright (c) 2017–2026 Maulik Mistry
SPDX-License-Identifier: Apache-2.0
-->
# tput_shell_colorize

A small, dependency-free shell utility for consistent terminal message formatting and color output in POSIX-compatible shell scripts, including Bash and Zsh.

## Features

- Uses `tput` for terminal-aware color output
- Gracefully falls back to uncolored output when `tput`, terminal capabilities, or a TTY are unavailable such as redirecting output
- Works with Bash, Zsh, and POSIX `sh`
- Provides simple message formatting functions
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

## Requirements

- POSIX-compatible shell
- tput for colored terminal output
- terminfo terminal definitions for color support

## License

Copyright © 2017–2026 Maulik Mistry

This project is licensed under Apache License 2.0. See the [LICENSE.txt](LICENSE.txt) file for details.

## Support

If you find this project useful and would like to support me, consider donating: 
- [PayPal](https://www.paypal.com/paypalme/m1st0)
- [Venmo](https://venmo.com/code?user_id=3319592654995456106&created=1753280522)

