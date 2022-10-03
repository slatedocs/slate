# Orders

## Get active orders

```shell
curl --location --request POST 'https://api.sx.bet/orders'
```

> The above command returns JSON structured like this

```json
{
  "status": "success",
  "data": [
    {
      "fillAmount": "0",
      "orderHash": "0xb46e5fff6498f061e93c4f5ed501ee72d924180d6aa78cdfd4d188d3383c91d4",
      "marketHash": "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
      "maker": "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
      "totalBetSize": "10000000000000000000",
      "percentageOdds": "70455284072443640000",
      "expiry": 2209006800,
      "apiExpiry": 1631233201
      "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
      "executor": "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
      "salt": "69415402816762328320330277846098411244657139277332120954321492419616371539163",
      "isMakerBettingOutcomeOne": true,
      "signature": "0x2aaea5b7c86166c0fbf2745c66aff794a23d21ac71ee143d08706700adbb59aa4c9b862286cf736acae5a74b10847ced73b628f4396eaab0af13b0c637fe4d021b",
      "createdAt": "2021-06-04T17:42:07.257Z"
    },
    {
      "fillAmount": "0",
      "orderHash": "0xd055d177477bd19faa9bad5cb4f907d8ebe069b614bb708713de068293cb809d",
      "marketHash": "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
      "maker": "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
      "totalBetSize": "10000000000000000000",
      "percentageOdds": "29542732332840140000",
      "expiry": 2209006800,
      "apiExpiry": 1631233201,
      "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
      "executor": "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
      "salt": "37069036490382455296196784649228360571791475783443923366499720348790829992442",
      "isMakerBettingOutcomeOne": false,
      "signature": "0x68fb16ff440c65e0306cb16a9842da362480208a9a75597d45ca722769d93e6a13c9196a2654f764bfd5c0d4c83165c0a8ffa955ae9af8afd17544b0db29eaf71c",
      "createdAt": "2021-06-04T17:42:07.303Z"
    },
    {
      "fillAmount": "0",
      "orderHash": "0xa5a30ca2251ac1431adf3d88f5734a53b78a13b2c707211eb83996bf099e3973",
      "marketHash": "0x15c5cceb3d27518241355e9f148ef96b0a178f1bcdb366dea2d0e621a9cef1fb",
      "maker": "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
      "totalBetSize": "10000000000000000000",
      "percentageOdds": "50000000000000000000",
      "expiry": 2209006800,
      "apiExpiry": 1631233201,
      "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
      "executor": "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
      "salt": "90344661128498016788545482097709376028896473001963632493180076229973632520043",
      "isMakerBettingOutcomeOne": true,
      "signature": "0x9b6c1e1d0cae584a3078f20d7bafd2031467a1cbce905027c6c970c13edef4357eeac625afe869417ffbecfb67b6672b765177d42fbda777f6b1a00962da2cc61c",
      "createdAt": "2021-06-04T17:42:07.270Z"
    }
  ]
}
```

This endpoint returns active orders on the exchange based on a few parameters

### HTTP Request

`POST https://api.sx.bet/orders`

### Request payload parameters

| Name         | Required | Type     | Description                                    |
| ------------ | -------- | -------- | ---------------------------------------------- |
| marketHashes | false    | string[] | Only get orders for these market hashes        |
| baseToken    | false    | string   | Only get orders denominated in this base token |
| maker        | false    | string   | Only get orders for this market maker          |

Note that one of `marketHashes` or `maker` is required.

### Response format

| Name                     | Type    | Description                                                                                                                                                                                                                                                                                                                                    |
| ------------------------ | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| fillAmount               | string  | How much this order has been filled in Ethereum units up to a max of `totalBetSize`. See [the token section](#tokens) of how to convert this into nominal amounts                                                                                                                                                                              |
| orderHash                | string  | A unique identifier for this order                                                                                                                                                                                                                                                                                                             |
| marketHash               | string  | The market corresponding to this order                                                                                                                                                                                                                                                                                                         |
| maker                    | string  | The market maker for this order                                                                                                                                                                                                                                                                                                                |
| totalBetSize             | string  | The total size of this order in Ethereum units. See the [the token section](#tokens) section for how to convert this into nominal amounts.                                                                                                                                                                                                     |
| percentageOdds           | string  | The odds that the `maker` receives in the sx.bet protocol format. To convert to an implied odds divide by 10^20. To convert to the odds that the taker would receive if this order would be filled in implied format, use the formula `takerOdds=1-percentageOdds/10^20`. See the [unit conversion section](#bookmaker-odds) for more details. |
| expiry                   | number  | Deprecated: the time in unix seconds after which this order is no longer valid. After deprecation, this field is always 2209006800 (2040)                                                                                                                                                                                                      |
| apiExpiry                | number  | The time in unix seconds after which this order is no longer valid.                                                                                                                                                                                                                                                                            |
| baseToken                | string  | The base token this order is denominated in                                                                                                                                                                                                                                                                                                    |
| executor                 | string  | The address permitted to execute on this order. This is set to the sx.bet exchange                                                                                                                                                                                                                                                             |
| salt                     | string  | A random number to differentiate identical orders                                                                                                                                                                                                                                                                                              |
| isMakerBettingOutcomeOne | boolean | `true` if the maker is betting outcome one (and hence taker is betting outcome two if filled)                                                                                                                                                                                                                                                  |
| signature                | string  | Signature of the maker on this order                                                                                                                                                                                                                                                                                                           |

<aside class="notice">
Note that <code>totalBetSize</code> and <code>fillAmount</code> are from *the perspective of the market maker*. <code>totalBetSize</code> can be thought of as the maximum amount of tokens the maker will be putting into the pot if the order was fully filled. <code>fillAmount</code> can be thought of as how many tokens the maker has already put into the pot. To compute how much space there is left from the taker's perspective, you can use the formula <code>remainingTakerSpace = (totalBetSize - fillAmount) * 10^20 / percentageOdds - (totalBetSize - fillAmount)</code>
</aside>

## Enabling betting

```shell
See the javascript section.
```

```javascript
import { MaxUint256 } from "ethers/constants";
import { Contract } from "ethers";
import { JsonRpcProvider } from "ethers/providers";

const walletAddress = process.env.WALLET_ADDRESS;
const tokenAddress = process.env.TOKEN_ADDRESS;
const tokenTransferProxyAddress = process.env.TOKEN_TRANSFER_PROXY_ADDRESS;
const provider = new providers.JsonRpcProvider(`https://rpc.sx.technology`);
const wallet = new Wallet(process.env.PRIVATE_KEY).connect(provider);
const tokenContract = new Contract(
  tokenAddress,
  [
    {
      constant: false,
      inputs: [
        { internalType: "address", name: "usr", type: "address" },
        { internalType: "uint256", name: "wad", type: "uint256" },
      ],
      name: "approve",
      outputs: [{ internalType: "bool", name: "", type: "bool" }],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
  ],
  wallet
);
await tokenContract.approve(tokenTransferProxyAddress, MaxUInt256, {
  gasLimit: 100000,
});
```

To enable betting, you need to approve the `TokenTransferProxy` contract for each token for which you wish to trade. Otherwise, any endpoints that create/cancel or fill orders will fail. For example if you want to trade with both ETH and USDC, you'll need to approve the contract twice, once for each token. The address of the `TokenTransferProxy` is available at `https://api.sx.bet/metadata` and the address of each token is given in [the tokens section](#tokens)

If you don't wish to do this programmatically, you can simply go to `https://sx.bet`, make a test bet with the account and token you'll be using, and you will be good to go.

If you want to do it programmatically, see the code sample on the right. Note you will need a little bit of MATIC to make this transaction (~$0.01 worth).

<aside class="notice">
Your assets must be on SX Network to place or fill orders via the API.
</aside>

## Post a new order

```shell
curl --location --request POST 'https://api.sx.bet/orders/new' \
--header 'Content-Type: application/json' \
--data-raw '{
    "orders": [
        {
            "marketHash": "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
            "maker": "0x6F75bA6c90E3da79b7ACAfc0fb9cf3968aa4ee39",
            "totalBetSize": "21600000000000000000",
            "percentageOdds": "47846889952153115000",
            "baseToken": "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
            "apiExpiry": 1631359800,
            "expiry": 2209006800,
            "executor": "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
            "isMakerBettingOutcomeOne": true,
            "signature": "0x50b00e7994b0656f78701537296444bccba2a7e4d46a84ff26c8ca48cb66774c76faa893be293412959779900232065c8236e489158070777d7a3e1a37d911811b",
            "salt": "61882422358902283358380622686147595792242782952753619716150366288606659190035"
        }
    ]
}'
```

```typescript
import { BigNumber, utils, providers, Wallet } from "ethers";

const order = {
  marketHash:
    "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
  maker: "0x6F75bA6c90E3da79b7ACAfc0fb9cf3968aa4ee39",
  totalBetSize: BigNumber.from("21600000000000000000").toString(),
  percentageOdds: BigNumber.from("47846889952153115000").toString(),
  baseToken: "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
  apiExpiry: 1631233201,
  expiry: 2209006800,
  executor: "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
  isMakerBettingOutcomeOne: true,
  salt: BigNumber.from(utils.randomBytes(32)).toString(),
};

const orderHash = utils.arrayify(
  utils.solidityKeccak256(
    [
      "bytes32",
      "address",
      "uint256",
      "uint256",
      "uint256",
      "uint256",
      "address",
      "address",
      "bool",
    ],
    [
      order.marketHash,
      order.baseToken,
      order.totalBetSize,
      order.percentageOdds,
      order.expiry,
      order.salt,
      order.maker,
      order.executor,
      order.isMakerBettingOutcomeOne,
    ]
  )
);

// Example shown here with an ethers.js wallet if you're interacting with the exchange using a private key
const wallet = new Wallet(process.env.PRIVATE_KEY);
const signature = await wallet.signMessage(orderHash);

// Example shown here if you're interacting with the exchange using an injected web3 provider such as metamask
const provider = new providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();
const signature = await signer.signMessage(orderHash);

const signedOrder = { ...order, signature };

const result = await fetch("https://api.sx.bet/orders/new", {
  method: "POST",
  body: JSON.stringify({ orders: [signedOrder] }),
  headers: { "Content-Type": "application/json" },
});

// Odds ladder testing

import { PERCENTAGE_PRECISION_EXPONENT } from "@betx/sportx-contracts";
import { BigNumber } from "bignumber.js";
import { BigNumber as EthBigNumber } from "ethers";

/**
 * Check if the odds are valid, i.e., in one of the allowed steps
 * @param odds Odds to check
 */
export function checkOddsLadderValid(odds: EthBigNumber) {
  // Logic:
  // 100% = 10^20
  // 10% = 10^19
  // 1% = 10^18
  // 0.1% = 10^17
  return odds.mod(EthBigNumber.from(10).pow(17)).eq(0);
}

/**
 * Rounds odds to the nearest step. If you're examining maker odds, a higher implied is better for the maker, so you should want to round up
 * @param odds Odds to round.
 * @param equidistantRoundUp If true, round up at equidistant (0.5 -> 1). Default true.
 */
export function roundOddsToNearestStep(
  odds: EthBigNumber,
  equidistantRoundUp: boolean = true
) {
  const step = EthBigNumber.from(10).pow(17);
  const bnStep = new BigNumber(step.toString());
  const bnOdds = new BigNumber(odds.toString());
  const firstPassDivision = bnOdds
    .dividedBy(bnStep)
    .toFixed(0, equidistantRoundUp ? 4 : 5);
  return EthBigNumber.from(firstPassDivision).mul(step);
}
```

> The above command returns JSON structured like this

```json
{
  "status": "success",
  "data": {
    "orders": [
      "0x7a9d420551c4a635849013dd908f7894766e97aee25fe656d0c5ac857e166fac"
    ]
  }
}
```

This endpoint offers new orders on the exchange (market making). Offering orders does not cost any fee or require you to have any MATIC tokens in your wallet.

Note you can offer as many orders as you wish, provided your total exposure for each token (as measured by `totalBetSize - fillAmount`) remains under your wallet balance. If your wallet balance dips under your total exposure, orders will be removed from the book until it reaches the minimum again.

<aside class="notice">
Your assets must be on SX Network to place orders.
</aside>

<aside class="warning">
If the API finds that your balance is consistently below your total exposure requiring orders to be cancelled, your account may be temporarily restricted. 
</aside>

To offer bets on sx.bet via the API, make sure you first enable betting by following the steps [here](#enabling-betting).

We enforce an odds ladder to prevent diming. Your offer, in implied odds, must fall on one of the steps on the ladder. Currently, that is set to intervals of 0.1%, meaning that your offer cannot fall between the steps. An offer of 50.1% would be valid, but an offer of 50.05% would not. You can check if your odds would fall on the ladder by taking the modulus of your odds and 10 ^ 17 and checking if it's equal to 0. See the bottom of the JavaScript tab for a sample on how to do this, and how to round your odds to the nearest step.

<aside class="warning">
Odds not on the ladder will be rejected and your order(s) will not be posted. 
</aside>

### HTTP Request

`POST https://api.sx.bet/orders/new`

### Request payload parameters

| Name   | Required | Type             | Description            |
| ------ | -------- | ---------------- | ---------------------- |
| orders | true     | SignedNewOrder[] | The new orders to post |

A `SignedNewOrder` object looks like this

| Name                     | Type    | Description                                                                                                       |
| ------------------------ | ------- | ----------------------------------------------------------------------------------------------------------------- |
| marketHash               | string  | The market you wish to place this order under                                                                     |
| maker                    | string  | The ethereum address offering the bet                                                                             |
| baseToken                | string  | The token this order is denominated in                                                                            |
| totalBetSize             | string  | The total bet size of the order in Ethereum units.                                                                |
| percentageOdds           | string  | The odds _the maker will be receiving_ as this order gets filled. Must be on the odds ladder or will be rejected. |
| expiry                   | number  | Deprecated. Time in UNIX seconds after which this order is no longer valid. Must always be 2209006800.            |
| apiExpiry                | number  | Time in UNIX seconds after which this order is no longer valid.                                                   |
| executor                 | string  | The sx.bet executor address. See the [metadata section](#get-metadata) for where to get this address              |
| salt                     | string  | A random 32 byte string to differentiate between between orders with otherwise identical parameters               |
| isMakerBettingOutcomeOne | boolean | `true` if the maker is betting outcome one (and hence taker is betting outcome two if filled)                     |
| signature                | string  | The signature of the maker on this order payload                                                                  |

<aside class="notice">
The address in the <code>maker</code> field must match the account being used to create the signature!
</aside>

### Response format

| Name     | Type     | Description                                            |
| -------- | -------- | ------------------------------------------------------ |
| status   | string   | `success` or `failure` if the request succeeded or not |
| data     | object   | The response data                                      |
| > orders | string[] | The order hashes corresponding to the new orders       |

<aside class="notice">
Note that <code>totalBetSize</code> is from *the perspective of the market maker*. <code>totalBetSize</code> can be thought of as the maximum amount of tokens the maker (you) will be putting into the pot if the order was fully filled. This is the maximum amount you will risk.
</aside>

## Cancel individual orders

```shell
curl --location --request POST 'https://api.sx.bet/orders/cancel/v2' \
--header 'Content-Type: application/json' \
--data-raw '{
    "orderHashes": [
        "0x335d3dbd0621f0f6da90d1a58269e71b2fb5e91193dca75a0b90396cccb63001"
    ],
    "signature": "0x1763cb98a069657cb778fdc295eac48741b957bfe58e54f7f9ad03c6c1ca3d053d9ca2e6957af794991217752b69cb9aa4ac9330395c92e24c8c25ec19220e5a1b",
    "salt": "0x6845028402f518a1c90770554a71017cd434ae9f2c09aa56c9560835c1929650",
    "maker": "0xe087299AE9Acd0133d6D1544A97Bb0EEe24a2671",
    "timestamp": 1643897553
}'
```

```javascript
import ethSigUtil from "eth-sig-util";
import { randomBytes } from "@ethersproject/random";

// Example is shown using a private key

const privateKey = process.env.PRIVATE_KEY;
const bufferPrivateKey = Buffer.from(privateKey.substring(2), "hex");
const orderHashes = [
  "0x4ead6ef92741cd0b6e1ea32cb1d9586a85165e8bd780ab6f897992428c357bf1",
];
const salt = `0x${Buffer.from(randomBytes(32)).toString("hex")}`;
const timestamp = Math.floor(new Date().getTime() / 1000);
const wallet = new Wallet(privateKey);

function getCancelOrderEIP712Payload(orderHashes, salt, timestamp, chainId) {
  const payload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "chainId", type: "uint256" },
        { name: "salt", type: "bytes32" },
      ],
      Details: [
        { name: "orderHashes", type: "string[]" },
        { name: "timestamp", type: "uint256" },
      ],
    },
    primaryType: "Details",
    domain: {
      name: "CancelOrderV2SportX",
      version: "1.0",
      chainId,
      salt,
    },
    message: { orderHashes, timestamp },
  };
  return payload;
}

const payload = getCancelOrderEIP712Payload(orderHashes, salt, timestamp, 416);

const signature = ethSigUtil.signTypedData_v4(bufferPrivateKey, {
  data: payload,
});

const apiPayload = {
  signature,
  orderHashes,
  salt,
  maker: wallet.address,
  timestamp,
};

const result = await fetch("https://api.sx.bet/orders/cancel/v2", {
  method: "POST",
  body: JSON.stringify(apiPayload),
  headers: { "Content-Type": "application/json" },
});
```

> The above command returns json structured like this

```json
{
  "status": "success",
  "data": {
    "cancelledCount": 1
  }
}
```

This endpoint cancels existing orders on the exchange that you placed as a market maker. If passed orders that do not exist, they simply fail silently while the others will succeed.

<aside class="notice">
Ensure you use the <code>chainId</code> of SX Network, not the <code>chainId</code> of ETH mainnet or Polygon.
</aside>

### HTTP Request

`POST https://api.sx.bet/orders/cancel/v2`

### Request payload parameters

| Name        | Required | Type     | Description                                                                                                                                            |
| ----------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| orderHashes | true     | string[] | The order hashes to cancel                                                                                                                             |
| signature   | true     | string   | The EIP712 signature on the cancel order payload. See the [EIP712 signing section](#eip712-signing) for more details on how to compute this signature. |
| salt        | required | string   | A random 32 bytes hex string to protect against replay                                                                                                 |
| maker       | required | true     | The account from which you are cancelling orders                                                                                                       |
| timestamp   | required | true     | The current timestamp in UNIX seconds to protect against replay                                                                                        |

### Response format

| Name             | Type     | Description                                            |
| ---------------- | -------- | ------------------------------------------------------ |
| status           | string   | `success` or `failure` if the request succeeded or not |
| data             | object   | The response data                                      |
| > cancelledCount | string[] | How many orders were cancelled, of the orders passed   |

## Cancel event orders

```shell
curl --location --request POST 'https://api.sx.bet/orders/cancel/event' \
--header 'Content-Type: application/json' \
--data-raw '{
    "sportXeventId": "L1234123",
    "signature": "0x1763cb98a069657cb778fdc295eac48741b957bfe58e54f7f9ad03c6c1ca3d053d9ca2e6957af794991217752b69cb9aa4ac9330395c92e24c8c25ec19220e5a1b",
    "salt": "0x6845028402f518a1c90770554a71017cd434ae9f2c09aa56c9560835c1929650",
    "maker": "0xe087299AE9Acd0133d6D1544A97Bb0EEe24a2671",
    "timestamp": 1643898624
}'
```

```javascript
import ethSigUtil from "eth-sig-util";
import { randomBytes } from "@ethersproject/random";
import { Wallet } from "@ethersproject/wallet";

// Example is shown using a private key

const privateKey = process.env.PRIVATE_KEY;
const bufferPrivateKey = Buffer.from(privateKey.substring(2), "hex");
const sportXeventId = "L1231231";
const salt = `0x${Buffer.from(randomBytes(32)).toString("hex")}`;
const timestamp = Math.floor(new Date().getTime() / 1000);
const wallet = new Wallet(privateKey);

function getCancelOrderEventsEIP712Payload(
  sportXeventId,
  salt,
  timestamp,
  chainId
) {
  const payload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "chainId", type: "uint256" },
        { name: "salt", type: "bytes32" },
      ],
      Details: [
        { name: "sportXeventId", type: "string" },
        { name: "timestamp", type: "uint256" },
      ],
    },
    primaryType: "Details",
    domain: {
      name: "CancelOrderEventsSportX",
      version: "1.0",
      chainId,
      salt,
    },
    message: { sportXeventId, timestamp },
  };
  return payload;
}

const payload = getCancelOrderEventsEIP712Payload(
  sportXeventId,
  salt,
  timestamp,
  416
);

const signature = ethSigUtil.signTypedData_v4(bufferPrivateKey, {
  data: payload,
});

const apiPayload = {
  signature,
  sportXeventId,
  salt,
  maker: wallet.address,
  timestamp,
};

const result = await fetch("https://api.sx.bet/orders/cancel/v2", {
  method: "POST",
  body: JSON.stringify(apiPayload),
  headers: { "Content-Type": "application/json" },
});
```

> The above command returns json structured like this

```json
{
  "status": "success",
  "data": {
    "cancelledCount": 1
  }
}
```

This endpoint cancels existing orders on the exchange for a particular event that you placed as a market maker.

<aside class="notice">
Ensure you use the <code>chainId</code> of SX Network, not the <code>chainId</code> of ETH mainnet or Polygon. 
</aside>

### HTTP Request

`POST https://api.sx.bet/orders/cancel/event`

### Request payload parameters

| Name          | Required | Type   | Description                                                                                                                                            |
| ------------- | -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| sportXeventId | true     | string | The event for which orders should be cancelled                                                                                                         |
| signature     | true     | string | The EIP712 signature on the cancel order payload. See the [EIP712 signing section](#eip712-signing) for more details on how to compute this signature. |
| salt          | required | string | A random 32 bytes hex string to protect against replay                                                                                                 |
| maker         | required | true   | The account from which you are cancelling orders                                                                                                       |
| timestamp     | required | true   | The current timestamp in UNIX seconds to protect against replay                                                                                        |

### Response format

| Name             | Type     | Description                                            |
| ---------------- | -------- | ------------------------------------------------------ |
| status           | string   | `success` or `failure` if the request succeeded or not |
| data             | object   | The response data                                      |
| > cancelledCount | string[] | How many orders were cancelled, of the orders passed   |

## Cancel all orders

```shell
curl --location --request POST 'https://api.sx.bet/orders/cancel/all' \
--header 'Content-Type: application/json' \
--data-raw '{
    "signature": "0x1763cb98a069657cb778fdc295eac48741b957bfe58e54f7f9ad03c6c1ca3d053d9ca2e6957af794991217752b69cb9aa4ac9330395c92e24c8c25ec19220e5a1b",
    "salt": "0x6845028402f518a1c90770554a71017cd434ae9f2c09aa56c9560835c1929650",
    "maker": "0xe087299AE9Acd0133d6D1544A97Bb0EEe24a2671",
    "timestamp": 1643898624
}'
```

```javascript
import ethSigUtil from "eth-sig-util";
import { randomBytes } from "@ethersproject/random";
import { Wallet } from "@ethersproject/wallet";

// Example is shown using a private key

const privateKey = process.env.PRIVATE_KEY;
const bufferPrivateKey = Buffer.from(privateKey.substring(2), "hex");
const salt = `0x${Buffer.from(randomBytes(32)).toString("hex")}`;
const timestamp = Math.floor(new Date().getTime() / 1000);
const wallet = new Wallet(privateKey);

function getCancelAllOrdersEIP712Payload(salt, timestamp, chainId) {
  const payload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "chainId", type: "uint256" },
        { name: "salt", type: "bytes32" },
      ],
      Details: [{ name: "timestamp", type: "uint256" }],
    },
    primaryType: "Details",
    domain: {
      name: "CancelAllOrdersSportX",
      version: "1.0",
      chainId,
      salt,
    },
    message: { timestamp },
  };
  return payload;
}

const payload = getCancelOrderEventsEIP712Payload(salt, timestamp, 416);

const signature = ethSigUtil.signTypedData_v4(bufferPrivateKey, {
  data: payload,
});

const apiPayload = {
  signature,
  sportXeventId,
  salt,
  maker: wallet.address,
  timestamp,
};

const result = await fetch("https://api.sx.bet/orders/cancel/all", {
  method: "POST",
  body: JSON.stringify(apiPayload),
  headers: { "Content-Type": "application/json" },
});
```

> The above command returns json structured like this

```json
{
  "status": "success",
  "data": {
    "cancelledCount": 10
  }
}
```

This endpoint cancels ALL existing orders on the exchange that you placed as a market maker.

<aside class="notice">
Ensure you use the <code>chainId</code> of SX Network, not the <code>chainId</code> of ETH mainnet or Polygon.
</aside>

### HTTP Request

`POST https://api.sx.bet/orders/cancel/all`

### Request payload parameters

| Name      | Required | Type   | Description                                                                                                                                            |
| --------- | -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| signature | true     | string | The EIP712 signature on the cancel order payload. See the [EIP712 signing section](#eip712-signing) for more details on how to compute this signature. |
| salt      | required | string | A random 32 bytes hex string to protect against replay                                                                                                 |
| maker     | required | true   | The account from which you are cancelling orders                                                                                                       |
| timestamp | required | true   | The current timestamp in UNIX seconds to protect against replay.                                                                                       |

### Response format

| Name             | Type     | Description                                            |
| ---------------- | -------- | ------------------------------------------------------ |
| status           | string   | `success` or `failure` if the request succeeded or not |
| data             | object   | The response data                                      |
| > cancelledCount | string[] | How many orders were cancelled, of the orders passed   |

## Filling orders

```shell
curl --location --request POST 'https://api.sx.bet/orders/fill' \
--header 'Content-Type: application/json' \
--data-raw '{"orderHashes":["0x863a2288a640e1bb722da2ee7a6f323ea28caee8ac681d320534d0e7f2e849de","0x001f676d68baf85310145f85bc5aeba64108b234607b4fae25c704069ca8464a"],"takerAmounts":["10000000000000000000","10000000000000000000"],"taker":"0xa3bBFaB3645B2Dd4296cADc451d74574CD47Ba1a","takerSig":"0x09d2603a8c8646221d6972b04a5cdd8b13d6326a267329825567a25a5e63606b07b97c84640bfb3ee4a5053083ce178d9e0c9cbdf1b1dfd519fda0594fae30dc1c","fillSalt":"69231297238279245345865414293427982207908612843136003245427437324972455931243","action":"N/A","market":"N/A","betting":"N/A","stake":"N/A","odds":"N/A","returning":"N/A"}'
```

```javascript
import ethSigUtil from "eth-sig-util";
import {
  BigNumber,
  constants,
  Contract,
  providers,
  utils,
  Wallet,
} from "ethers";
import { randomBytes } from "ethers/lib/utils";

async function fillOrder() {
  const privateKey = process.env.PRIVATE_KEY;
  const takerAddress = process.env.TAKER_ADDRESS;
  const tokenAddress = process.env.TOKEN_ADDRESS;
  const tokenTransferProxyAddress = process.env.TOKEN_TRANSFER_PROXY_ADDRESS; // get from https://api.sx.bet/metadata
  const EIP712FillHasherAddress = process.env.EIP712_FILL_HASHER_ADDRESS; // get from https://api.sx.bet/metadata
  const bufferPrivateKey = Buffer.from(privateKey!.substring(2), "hex");
  const wallet = new Wallet(privateKey).connect(
    new providers.JsonRpcProvider(process.env.PROVIDER_URL)
  );
  const takerAmounts = ["10000000000000000000", "10000000000000000000"];
  const fillSalt = BigNumber.from(randomBytes(32)).toString();
  const approvalAmount = constants.MaxUint256;
  const tokenContract = new Contract(
    tokenAddress,
    [
      {
        constant: false,
        inputs: [
          { internalType: "address", name: "usr", type: "address" },
          { internalType: "uint256", name: "wad", type: "uint256" },
        ],
        name: "approve",
        outputs: [{ internalType: "bool", name: "", type: "bool" }],
        payable: false,
        stateMutability: "nonpayable",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "user",
            type: "address",
          },
        ],
        name: "getNonce",
        outputs: [
          {
            internalType: "uint256",
            name: "nonce",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
        ],
        name: "nonces",
        outputs: [
          {
            internalType: "uint256",
            name: "",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
        constant: true,
      },
    ],
    wallet
  );

  let nonce = await tokenContract.getNonce(takerAddress);
  const tokenName: string = await tokenContract.name();
  const abiEncodedFunctionSig = tokenContract.interface.encodeFunctionData(
    "approve",
    [tokenTransferProxyAddress, approvalAmount]
  );

  const ordersToFill = [
    {
      fillAmount: "0",
      orderHash:
        "0x863a2288a640e1bb722da2ee7a6f323ea28caee8ac681d320534d0e7f2e849de",
      marketHash:
        "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
      maker: "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
      totalBetSize: "120000000000000000000",
      percentageOdds: "68860772772306080000",
      expiry: 2209006800,
      apiExpiry: 1631233201,
      baseToken: "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
      executor: "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
      salt:
        "64542697517744547417546237340530363903382582642857122744382059379852833736063",
      isMakerBettingOutcomeOne: true,
      signature:
        "0xa58255f9f7bb8a2698d66f9931a3d4ebe2e5605299a57d78b7c048f26585fdb5144b16bb930ad564f2e2819f66c8c20c2c076d8951728d8242481d58af221fc51b",
      createdAt: "2021-06-24T21:44:51.355Z",
    },
    {
      fillAmount: "0",
      orderHash:
        "0x001f676d68baf85310145f85bc5aeba64108b234607b4fae25c704069ca8464a",
      marketHash:
        "0x0eeace4a9bbf6235bc59695258a419ed3a05a2c8e3b6a58fb71a0d9e6b031c2b",
      maker: "0x63a4491dC73245E181c47BAe0ae9d6627E56dE55",
      totalBetSize: "120000000000000000000",
      percentageOdds: "27138321995464855000",
      expiry: 2209006800,
      apiExpiry: 1631233201,
      baseToken: "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063",
      executor: "0x3E91041b9e60C7275f8296b8B0a97141e6442d49",
      salt:
        "33394198022904122521460365691253625674733505262618329029186356280403872887283",
      isMakerBettingOutcomeOne: false,
      signature:
        "0xb52be3279a092823bb46b3bd9a397bef2a06eda95a519718992ea88d73a4375874728cb7c5f6527b67195e44f3f0f0d29956dc05e18e775547d8f2faf3d4bd001c",
      createdAt: "2021-06-24T21:44:51.374Z",
    },
  ];

  const signingPayload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "chainId", type: "uint256" },
        { name: "verifyingContract", type: "address" },
      ],
      Details: [
        { name: "action", type: "string" },
        { name: "market", type: "string" },
        { name: "betting", type: "string" },
        { name: "stake", type: "string" },
        { name: "odds", type: "string" },
        { name: "returning", type: "string" },
        { name: "fills", type: "FillObject" },
      ],
      FillObject: [
        { name: "orders", type: "Order[]" },
        { name: "makerSigs", type: "bytes[]" },
        { name: "takerAmounts", type: "uint256[]" },
        { name: "fillSalt", type: "uint256" },
        { name: "beneficiary", type: "address" }
      ],
      Order: [
        { name: "marketHash", type: "bytes32" },
        { name: "baseToken", type: "address" },
        { name: "totalBetSize", type: "uint256" },
        { name: "percentageOdds", type: "uint256" },
        { name: "expiry", type: "uint256" },
        { name: "salt", type: "uint256" },
        { name: "maker", type: "address" },
        { name: "executor", type: "address" },
        { name: "isMakerBettingOutcomeOne", type: "bool" },
      ],
    },
    primaryType: "Details",
    domain: {
      name: "SportX",
      version: process.env.DOMAIN_VERSION, // get from https://api.sx.bet/metadata
      chainId: 416 // get from https://api.sx.bet/metadata,
      verifyingContract: EIP712FillHasherAddress,
    },
    message: {
      action: "N/A",
      market: "N/A",
      betting: "N/A",
      stake: "N/A",
      odds: "N/A",
      returning: "N/A",
      fills: {
        makerSigs: ordersToFill.map((order) => order.signature),
        orders: ordersToFill.map((order) => ({
          marketHash: order.marketHash,
          baseToken: order.baseToken,
          totalBetSize: order.totalBetSize.toString(),
          percentageOdds: order.percentageOdds.toString(),
          expiry: order.expiry.toString(),
          salt: order.salt.toString(),
          maker: order.maker,
          executor: order.executor,
          isMakerBettingOutcomeOne: order.isMakerBettingOutcomeOne,
        })),
        takerAmounts,
        fillSalt,
        beneficiary: constants.AddressZero
      },
    },
  };

  const approveProxySigningPayload = {
    types: {
      EIP712Domain: [
        { name: "name", type: "string" },
        { name: "version", type: "string" },
        { name: "verifyingContract", type: "address" },
        { name: "salt", type: "bytes32" },
      ],
      MetaTransaction: [
        { name: "nonce", type: "uint256" },
        { name: "from", type: "address" },
        { name: "functionSignature", type: "bytes" },
      ],
    },
    domain: {
      name: tokenName,
      version: "1",
      salt: utils.hexZeroPad(utils.hexlify(416), 32), https://api.sx.bet/metadata
      verifyingContract: tokenAddress,
    },
    message: {
      nonce,
      from: takerAddress,
      functionSignature: abiEncodedFunctionSig,
    },
    primaryType: "MetaTransaction",
  };

  const approveProxySignature = ethSigUtil.signTypedData_v4(bufferPrivateKey, {
    data: approveProxySigningPayload,
  });

  const signature = ethSigUtil.signTypedData_v4(bufferPrivateKey, {
    data: signingPayload,
  });

  const apiPayload = {
    orderHashes: ordersToFill.map((order) => order.orderHash),
    takerAmounts,
    taker: takerAddress,
    takerSig: signature,
    fillSalt,
    action: "N/A",
    market: "N/A",
    betting: "N/A",
    stake: "N/A",
    odds: "N/A",
    returning: "N/A",
    approveProxyPayload: {
      owner: takerAddress,
      spender: tokenTransferProxyAddress,
      tokenAddress,
      amount: approvalAmount.toString(),
      signature: approveProxySignature,
    },
  };

  const response = await fetch(`https://api.sx.bet/orders/fill`, {
    method: "POST",
    body: JSON.stringify(apiPayload),
    headers: { "Content-Type": "application/json" },
  });
}
```

> The above command returns json structured like this

```json
{
  "status": "success",
  "data": {
    "fillHash": "0x840763ae29b7a6adfa0e315afa47be30cdebd5b793d179dc07dc8fc4f0034965"
  }
}
```

This endpoint fills orders on the exchange. Multiple orders can be filled at once and no gas is paid as this is a meta transaction submitted by the API itself. _Therefore you do not require any MATIC in your wallet to fill orders_.

Note that pre-game has a built-in betting delay of 2s and in-game betting has a built-in betting delay of 5s. This is added to guard against toxic flow and high spikes in latency from the bookmaker's side. It is effectively protection for the bookmaker. If the odds change within that delay time, the order will be cancelled and an error will be thrown.

To fill orders on sx.bet via the API, make sure you first enable betting by following the steps [here](#enabling-betting)

<aside class="notice">
Your assets must be on SX Network to place bets.
</aside>

<aside class="notice">
Ensure you use the <code>chainId</code> of SX Network, not the <code>chainId</code> of ETH mainnet or Polygon.
</aside>

### HTTP Request

`POST https://api.sx.bet/orders/fill`

### Request payload parameters

| Name                | Required | Type                    | Description                                                                                                                                                                                                                                                 |
| ------------------- | -------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| action              | true     | string                  | User facing string for what action the user is taking. Can simply set to "N/A" when using the API                                                                                                                                                           |
| betting             | true     | string                  | User facing string for what bet the user is making. Can simply set to "N/A" when using the API.                                                                                                                                                             |
| fillSalt            | true     | string                  | Random 32 byte string to identify this fill. Must be the same `fillSalt` used when computing the EIP712 payload                                                                                                                                             |
| market              | true     | string                  | User facing string for what market the user is betting on. Can simply set to "N/A" when using the API                                                                                                                                                       |
| odds                | true     | string                  | User facing string for the odds the user is receiving. Can simply set to "N/A" when using the API                                                                                                                                                           |
| orderHashes         | true     | string[]                | Orders being filled. Must be the order hashes of the orders used in computing the EIP712 payload. Must be the same length as `takerAmounts`                                                                                                                 |
| returning           | true     | string                  | User facing string for what the bet wil be returning. Can simply set to "N/A" when using the API.                                                                                                                                                           |
| taker               | true     | string                  | Address of the taker taking the bet                                                                                                                                                                                                                         |
| stake               | true     | string                  | User facing string for how much the user is risking. Can simly set to "N/A" when using the API.                                                                                                                                                             |
| takerAmounts        | true     | string[]                | How much each order is being filled, ordered by index. Must be in the same order as `orderHashes`, and the same length as `orderHashes`. It also must be the same and in the same order as the `takerAmounts` array used when computing the EIP712 payload. |
| takerSig            | true     | string                  | The EIP712 signature of the `taker` on the payload. See the example of how to compute this.                                                                                                                                                                 |
| message             | true     | string                  | A user-facing message for the eip712 signing. Can be anything.                                                                                                                                                                                              |
| signature           | true     | string                  | The EIP712 signature on the cancel order payload. See the [EIP712 signing section](#eip712-signing) for general information on how to compute this signature. See the example for the specific parameters required.                                         |
| approveProxyPayload | false    | `ApproveSpenderPayload` | Extra object required if you wish to atomically `ERC20.approve()` prior to the bet. This can be useful from a UX point of view if you don't want the user to have to wait until the approval is mined before the bet can be submitted                       |
| affiliateAddress    | false    | string                  | Set the `taker` to a valid affiliate's address.                                                                                                                                                                                                             |

where an `ApproveSpenderPayload` looks like

| Name         | Required | Type   | Description                                                                                                                                                                                     |
| ------------ | -------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| owner        | true     | string | Address of the bettor/taker                                                                                                                                                                     |
| spender      | true     | string | Address of the contract permitted to spend tokens on behalf of the bettor/taker to bet. See the `TokenTransferProxy` address in the available at `https://api.sx.bet/metadata` for this address |
| tokenAddress | true     | string | Address of the token being used to bet. Must be the same as the token referenced in the orders being filled                                                                                     |
| amount       | true     | string | Amount of tokens to approve. Must be greater than or equal to the total tokens bet from the bettors's perspective, i.e., how many tokens are leaving the bettor's wallet                        |
| signature    | true     | string | The EIP712 signature of the this payload.                                                                                                                                                       |

### Response format

| Name       | Type   | Description                                            |
| ---------- | ------ | ------------------------------------------------------ |
| status     | string | `success` or `failure` if the request succeeded or not |
| data       | object | The response data                                      |
| > fillHash | string | A unique identifier for this fill.                     |

<aside class="warning">
Note that <code>fillAmounts</code> are from *the perspective of the market maker*. <code>fillAmounts</code> can be thought of as how many tokens the maker(s) will be putting into the pot. Given an amount you as the taker want to bet, you can use the following formula to convert what value you have to use as <code>fillAmount</code> in this endpoint. <code>fillAmount = takerBetAmount * percentageOdds / (10^20 - percentageOdds)</code>
</aside>

<aside class="notice">
To convert a <code>fillAmount</code> (what the market maker pays) to what the taker will pay, you can use the formula <code>takerPayAmount = fillAmount * 10^20 / percentageOdds - fillAmount </code>. Intuitively, this is the pot size (<code>fillAmount * 10^20 / percentageOdds)</code> minus what the maker is putting in
</aside>
