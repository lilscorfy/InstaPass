# INSTA\_PASS - Instagram Recovery Tool

INSTA\_PASS is a Termux-based tool that helps users recover their Instagram accounts legally by using email or phone number.

## Features
- Requires GitHub follow verification before installation.
- Allows account recovery via email or phone number.
- CLI-based with an interactive menu.

## Installation
Run the following commands in Termux:
```bash
pkg update -y && pkg upgrade -y
pkg install curl -y
curl -o install.sh https://raw.githubusercontent.com/lilscorfy/InstaPass/main/install.sh
chmod +x install.sh
./install.sh
