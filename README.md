# 🐼 Kodiak Static
Static content for Kodiak infrastructure

### Contributing
When you want to bring your token into the kodiak interface follow these steps:

1. Create a fork of this repository, work further in your own version of it
2. Add your logo to `src/tokens` in png format, use only lower case in the file name
3. Add the appropriate entry to `tokenLists/bartio.json`. Use the template you'll find below
4. Send this Pull Requets with the name "Add {SYMBOL} token." to branch `main`

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
‼️ Do not change the `logoURI` domain, only replace the name of your new file that you added in the last step.

‼️ The file name must be in lower case and in PNG format 

## Semantic versioning
Lists include a version field, which follows semantic versioning. You need to update the version number following the rules described below:

- Increment major version when tokens are removed
- Increment minor version when tokens are added
- Increment patch version when tokens already on the list have minor details changed (name, symbol, logo URL, decimals)
- Changing a token address or chain ID is considered both a remove and an add, and should be a major version update.

Unless the version is incremented correctly, the list will not be updated.
