#!/bin/bash

KEY_ID="ED444FF07D8D0BF6"
KEY_PATH="/etc/apt/trusted.gpg.d/kali.gpg"
KEY_URL="https://archive.kali.org/archive-key.asc"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}🔧 Kali Repository Fix Tool - Updating GPG key...${NC}"

# Check for required tools
for cmd in curl gpg apt-key; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${RED}❌ Required command '$cmd' is not installed. Please install it first.${NC}"
        exit 1
    fi
done

# Check if the expired key exists
echo -e "${GREEN}🔍 Checking for the expired GPG key...${NC}"
if apt-key list 2>/dev/null | grep -q "$KEY_ID"; then
    echo -e "${RED}⚠️ Expired key found. Removing...${NC}"
    sudo apt-key del "$KEY_ID"
else
    echo -e "${GREEN}✅ No expired key found.${NC}"
fi

# Download and install the new key
echo -e "${GREEN}📥 Downloading and installing the new key...${NC}"
if sudo curl -fsSL "$KEY_URL" | sudo gpg --dearmor -o "$KEY_PATH"; then
    echo -e "${GREEN}🔐 New GPG key saved to: $KEY_PATH${NC}"
else
    echo -e "${RED}❌ Failed to fetch or install the GPG key.${NC}"
    exit 1
fi

# Update system
echo -e "${GREEN}🔄 Updating package lists...${NC}"
if sudo apt update; then
    echo -e "${GREEN}✅ System updated successfully!${NC}"
else
    echo -e "${RED}❌ Failed to update. Please check your repositories.${NC}"
fi
