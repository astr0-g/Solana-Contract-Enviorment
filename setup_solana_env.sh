#!/bin/bash

# Automated Installation Script: Rust, Solana CLI, Anchor CLI, Node.js, and Yarn

# 1. Install essential build tools
echo ">>> Installing build-essential, pkg-config, and libssl-dev..."
apt-get update
apt-get install -y build-essential pkg-config libssl-dev curl

# 2. Install Rust (Version 1.76.0)
echo ">>> Installing Rust 1.76.0..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.76.0
source $HOME/.cargo/env

# 3. Install Solana CLI (Version v1.17.25)
echo ">>> Installing Solana CLI v1.17.25..."
sh -c "$(curl -sSfL https://release.solana.com/v1.17.25/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# 4. Install Anchor CLI (Version v0.29.0)
echo ">>> Installing Anchor CLI v0.29.0..."
cargo install --git https://github.com/coral-xyz/anchor --tag v0.29.0 anchor-cli --locked

# 5. Install Node.js (Version 20.18.0) using nvm
echo ">>> Installing Node.js v20.18.0 with nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install 20.18.0
nvm use 20.18.0
nvm alias default 20.18.0

# 6. Install Yarn
echo ">>> Installing Yarn..."
npm install -g yarn

# 7. Add environment variables to .bashrc
echo ">>> Adding environment variables to ~/.bashrc..."
cat << 'EOF' >> ~/.bashrc
# Solana, Rust, Anchor, and Node.js paths
export PATH="$HOME/.cargo/bin:$HOME/.local/share/solana/install/active_release/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
EOF

# Reload the environment to apply changes immediately
source ~/.bashrc

# 8. Verify installations
echo ">>> Installation completed. Verifying installed versions..."
rustc --version
solana --version
anchor --version
node --version
yarn --version

echo ">>> Solana development environment setup is successful! Please restart the terminal or reload .bashrc."
