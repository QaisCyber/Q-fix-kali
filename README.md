# Q-fix-kali

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
git clone https://github.com/QaisCyber/Q-fix-kali.git
cd Q-fix-kali
chmod +x Qfix-kali-repo.sh
./Qfix-kali-repo.sh
