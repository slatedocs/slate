Architecture
============

Local node
----------
<img src="images/architecture_local.svg" onerror="this.src='images/architecture_local.png'">
If you are running a [local Ethereum node](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum), sending RPC requests to your local node is the preferred way to use Augur.

<aside class="notice">To use "sendTransaction" RPC commands (i.e., anything that requires Ether / is actually sent to the network) you will need to unlock your Ethereum node.  If you are running geth, the easiest way to do this is to start it with the <code>--unlock</code> option:

<code class="block">geth --unlock 0 --testnet --rpc --rpccorsdomain "http://localhost:8545"</code></aside>

Hosted node
-----------
<img src="images/architecture_hosted.svg" onerror="this.src='images/architecture_hosted.png'">
Understandably, many users will not want to go to the trouble of running a full Ethereum node solely for the purpose of using Augur.  Augur maintains four public Ethereum nodes, which are used automatically by [app.augur.net](https://app.augur.net) if a local Ethereum node is not detected:

- [https://eth1.augur.net](https://eth1.augur.net)
- [https://eth3.augur.net](https://eth3.augur.net)
- [https://eth4.augur.net](https://eth4.augur.net)
- [https://eth5.augur.net](https://eth5.augur.net)

All four nodes are temporarily on a private chain (networkid 7), rather than the main Frontier network, while Augur is in alpha/beta testing.  (We also maintain a public Ethereum node on the Frontier network at [https://eth2.augur.net](https://eth2.augur.net), although the Augur contracts are not currently maintained on Frontier.)
