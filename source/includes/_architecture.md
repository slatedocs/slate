Architecture
============

Local node
----------
<img src="images/architecture_local.svg" onerror="this.src='images/architecture_local.png'">
If you are running a [local Ethereum node](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum), sending RPC requests to your local node is the best (fastest) way to use Augur.  To do this, you can either download and run the Augur app locally, or simply visit [http://app.augur.net](http://app.augur.net), which is configured to automatically talk to your local node, if present.

<aside class="notice">To use sendTransaction/sendRawTransaction RPC commands (i.e., anything that requires Ether / is actually sent to the network) you will need to unlock your Ethereum node.  If you are running geth, the easiest way to do this is to start it with the <code>--unlock</code> option:

<code class="block">geth --unlock 0 --testnet --rpc --ws --rpccorsdomain "http://localhost:8080" --wsorigins "http://localhost:8080"</code>

The <code>--ws</code> flag allows websocket connections, which are recommended for speed.  The <code>--rpccorsdomain</code> and <code>--wsorigins</code> flags specify what domains are allowed to send RPC requests to your geth node.  Here <code>http://localhost:8080</code> is whitelisted; this is the default address where the <a href="https://github.com/AugurProject/augur">Augur client</a> is served, if you build Augur locally.  To use your local Ethereum node with a remote (hosted) Augur client, you will need to set <code>--rpccorsdomain</code> and/or <code>--wsorigins</code> to your host's address; for example, if the remote host is at <code>http://app.augur.net</code>, then you would use <code>http://app.augur.net</code> for <code>--rpccorsdomain</code> and <code>--wsorigins</code>.</aside>

Note to geth users: because geth's RPC server uses regular (unencrypted) HTTP, in order for the Augur app to communicate with your local geth node, it must be served over HTTP.

Hosted node
-----------
<img src="images/architecture_hosted.svg" onerror="this.src='images/architecture_hosted.png'">
Understandably, many users will not want to go to the trouble of running a full Ethereum node solely for the purpose of using Augur.  Augur maintains a public (testnet) Ethereum node at [https://eth3.augur.net](https://eth3.augur.net), which is used automatically by [augur.net](https://augur.net) (and by [local.augur.net](http://local.augur.net) if a local Ethereum node is not detected).  Augur's node is on the Morden testnet.
