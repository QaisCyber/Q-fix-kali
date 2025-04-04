# fix-kali-gpg

🔐 A simple Bash tool to fix expired GPG key issues with the Kali Linux repository on Debian/Ubuntu-based systems.

## 📦 Features

- Detects and removes the expired GPG key
- Installs the updated key from Kali's official source
- Automatically runs `apt update`
- Verifies required tools (`curl`, `gpg`, `apt-key`) are installed

## 🧰 Requirements

- Bash
- curl
- gpg
- apt-key

## 🚀 Usage

```bash
git clone https://github.com/QaisCyber/fix-kali-gpg.git
cd fix-kali-gpg/scripts
chmod +x fix-kali-repo.sh
./fix-kali-repo.sh
