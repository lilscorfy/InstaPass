#!/bin/bash

GITHUB_USER="lilscorfy"

echo -e "\e[1;34mChecking if you follow @$GITHUB_USER on GitHub...\e[0m"

# Ask for GitHub username
read -p "Enter your GitHub username: " USERNAME

# Fetch user's following list and check
FOLLOWING=$(curl -s "https://api.github.com/users/$USERNAME/following" | grep -o "\"login\": \"$GITHUB_USER\"")

if [[ -z "$FOLLOWING" ]]; then
    echo -e "\e[1;31m[✘] Access Denied! You must follow @$GITHUB_USER on GitHub to install InstaPass.\e[0m"
    exit 1
fi

echo -e "\e[1;32m[✔] Verified! Installing InstaPass...\e[0m"

# Install dependencies
pkg update -y && pkg upgrade -y
pkg install python -y
pip install requests

# Download InstaPass script
mkdir -p $PREFIX/bin
curl -o $PREFIX/bin/instapass.py https://raw.githubusercontent.com/lilscorfy/InstaPass/main/instapass.py
chmod +x $PREFIX/bin/instapass.py

cp instapass.py $PREFIX/bin/
chmod +x $PREFIX/bin/instapass.py

# Create a command shortcut
echo "python3 $PREFIX/bin/instapass.py" > $PREFIX/bin/INSTA\_PASS
chmod +x $PREFIX/bin/INSTA\_PASS

echo -e "\e[1;32m[✔] Installation Complete! Run 'INSTA_PASS' to start.\e[0m"
