# 🐼 Kodiak Static
Static content for Kodiak infrastructure including token lists and ecosystem projects.

## Contents
This repository contains:

1. Token lists for different Berachain networks
2. Ecosystem project listings
3. Static assets (logos, icons)

### Contributing to Token Lists
When you want to bring your token into the kodiak interface follow these steps:

1. Create a fork of this repository, work further in your own version of it
2. Add your logo to `src/tokens` in png format, use only lower case in the file name
3. Add the appropriate entry to the relevant token list file in the `tokenLists` directory, target your network of choice.
4. Send this Pull Requets with the name "Add {SYMBOL} token." to branch `main`

### Token Entry Template
```json
{
  "chainId": 80084,
  "address": "0x1E94a8ceE3E5bD97e0cD933B8F8537fC3Db4FcE7",
  "symbol": "BEARTIC",
  "name": "Beartic Token",
  "decimals": 18,
  "logoURI": "https://static.kodiak.finance/tokens/junky.png",
  "tags": []
}
```

### Important Notes
‼️ Do not change the `logoURI` domain, only replace the name of your new file that you added in the last step.

‼️ The file name must be in lower case and in PNG format 

## Semantic versioning
Lists include a version field, which follows semantic versioning. You need to update the version number following the rules described below:

- Increment major version when tokens are removed
- Increment minor version when tokens are added
- Increment patch version when tokens already on the list have minor details changed (name, symbol, logo URL, decimals)
- Changing a token address or chain ID is considered both a remove and an add, and should be a major version update.

Unless the version is incremented correctly, the list will not be updated.



### Contributing to Ecosystem Projects
To add your project to the Kodiak ecosystem list:

1. Fork this repository
2. Add your project logo to `ecosystem/logo` in PNG format
3. Add your project entry to ecosystem/projects.json
4. Submit a Pull Request with the name "Add {PROJECT} to ecosystem" to the main branch

### Ecosystem Project Entry Template
```json
{
  "name": "Your Project",
  "category": "Infrastructure",
  "description": "A brief description of your project (max 100 characters)",
  "logoURI": "https://static.kodiak.finance/ecosystem/logo/yourproject.png",
  "link": "https://yourproject.xyz/"
}
```

### Available Categories:

1. Derivatives
2. Gamblefi
3. Infrastructure
4. Launchpad
5. Lending
6. LST / LSD
7. Structured Products

## Semantic Versioning
All lists in this repository follow semantic versioning. You must update the version number following these rules:

1. Increment major version when ecosystem/projects are removed
2. Increment minor version when ecosystem/projects are added
3. Increment patch version when ecosystem/projects already on the list have minor details changed (name, symbol, logo URL, decimals)
4. Replacing a project with a completely different one (which is effectively a removal and addition), and should be a major version update