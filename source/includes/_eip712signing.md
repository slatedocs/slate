# EIP712 Signing

For certain operations with the API, we require you to sign data using the [EIP712 specification](https://eips.ethereum.org/EIPS/eip-712). We provide two examples to sign data in the EIP712 fashion in JavaScript if you're using an injected provider (such as MetaMask or another wallet) or a private key.

As of now we have not tested other libraries in other languages that support EIP712.

## Private key signing example

```shell
See the javascript section
```

```javascript
import ethSigUtil from "eth-sig-util";

const privateKey = process.env.PRIVATE_KEY
// Assuming process.env.PRIVATE_KEY is "0x"-prefixed
const bufferPrivateKey = Buffer.from(privateKey.substring(2), "hex");
const payload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "chainId", type: "uint256" }
      ],
      Details: [
        { name: "message", type: "string" },
        { name: "orders", type: "string[]" }
      ]
    },
    primaryType: "Details",
    domain: {
      name: "CancelOrderSportX",
      version: "1.0",
      chainId: 416
    },
    message: {
        message: "Are you sure you want to cancel these orders"
        orders: ["0x550128e997978495eeae503c13e2e30243d747e969c65e1a0b565c609e097506"]
    }
};
const signature = ethSigUtil.signTypedData_v4(
    bufferPrivateKey,
    { data: payload }
);
```

Here we use a private key directly which is the most straightforward way to sign data and does not require access to an authenticated node. It's also the fastest.

## Injected provider signing example

```shell
See the javascript section
```

```javascript
import { providers } from "ethers";

const walletAddress = "0xa1e32a027271f7d3d5c629b1c87289ccf9611533"
const provider = new providers.Web3Provider(window.ethereum)
const payload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "chainId", type: "uint256" }
      ],
      Details: [
        { name: "message", type: "string" },
        { name: "orders", type: "string[]" }
      ]
    },
    primaryType: "Details",
    domain: {
      name: "CancelOrderSportX",
      version: "1.0",
      chainId: 416
    },
    message: {
        message: "Are you sure you want to cancel these orders"
        orders: ["0x550128e997978495eeae503c13e2e30243d747e969c65e1a0b565c609e097506"]
    }
};
const signature = await provider.send("eth_signTypedData_v4", [walletAddress, JSON.stringify(payload)])
```

Here we use `ethers.js` and show an example with MetaMask but provided the injected provider has a `send()` function and supports the `eth_signTypedData` JSON-RPC method, it will work. Note that in some wallets, such as metamask, `eth_signTypedData_v4` is the most up to date version of `eth_signTypedData`.
