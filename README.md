# Solana Program Development with Anchor

This repository demonstrates setting up a Solana development environment using **Anchor CLI**. Anchor simplifies the development, testing, and deployment of Solana smart contracts.

---

## 📦 Prerequisites

Make sure you have the following installed:

1. **Rust** (1.70.0): Install via [rustup](https://rust-lang.org/tools/install)
2. **Solana CLI** (v1.17.25): Install via Solana's release script
3. **Node.js** (v20.18.0) and **Yarn**
4. **Anchor CLI** (v0.29.0)

Refer to the [installation script](./install.sh) for an automated setup.
to use
```
nano setup_solana_env.sh
```

```
chmod +x setup_solana_env.sh
```

```
./setup_solana_env.sh
```
---

## 🚀 Getting Started

### 1. Initialize an Anchor Project
To initialize a new Anchor project, use the following command:

```bash
anchor init <project-name>
```

- Replace `<project-name>` with your desired project name.
- This will create a new directory with the Anchor project structure.

### 2. Directory Structure
After initialization, the directory structure will look like this:

```text
<project-name>/
├── app/          # Frontend code (optional)
├── migrations/   # Deployment scripts
├── programs/     # Solana smart contracts (Rust code)
├── tests/        # JavaScript/TypeScript tests
├── Anchor.toml   # Anchor configuration file
└── Cargo.toml    # Rust dependencies
```

---

## 🔨 Building and Deploying

### 3. Build the Project
To compile the smart contract, run:

```bash
anchor build
```

This will generate a build output in the `/target` folder.

### 4. Deploy to Localnet
Start the Solana local validator and deploy your program locally:

```bash
solana-test-validator
```

In another terminal, deploy your program:

```bash
anchor deploy
```

The program ID will be generated after successful deployment. Update the `Anchor.toml` file with the new program ID.

### 5. Verify the Deployment
Run the following command to verify the deployment:

```bash
solana program show <PROGRAM_ID>
```

Replace `<PROGRAM_ID>` with the program's ID.

---

## ⚙️ Useful Commands
Here is a list of frequently used **Anchor** commands:

| Command                  | Description                                           |
|--------------------------|-------------------------------------------------------|
| `anchor init`            | Initialize a new Anchor project                      |
| `anchor build`           | Build the Solana smart contract                      |
| `anchor deploy`          | Deploy the program to the Solana cluster             |
| `anchor test`            | Run unit tests using JavaScript/TypeScript           |
| `anchor run <script>`    | Execute a custom script in the `migrations` folder   |
| `anchor upgrade`         | Upgrade a deployed program                           |
| `anchor idl init`        | Initialize the IDL (Interface Definition Language)   |
| `anchor idl upgrade`     | Upgrade the IDL                                      |

---

## 🧪 Testing

To test your program, run the following command:

```bash
anchor test
```

This will use the test scripts located in the `tests/` directory.

---

## 🌐 Deploy to Devnet/Mainnet
To deploy on **Devnet** or **Mainnet**, update the Solana cluster configuration:

```bash
solana config set --url https://api.devnet.solana.com
```

Then deploy your program:

```bash
anchor deploy
```

---

## 📝 References
- [Solana Documentation](https://docs.solana.com/)
- [Anchor Framework Guide](https://book.anchor-lang.com/)
- [Rust Programming Language](https://doc.rust-lang.org/)

---

## 🎉 Contributing
Feel free to fork this repository, submit issues, or make pull requests to contribute.

---

## 📜 License
This project is licensed under the [MIT License](LICENSE).
