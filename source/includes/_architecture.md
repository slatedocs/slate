Architecture
============

Local node
----------
<img src="images/architecture_local.svg" onerror="this.src='images/architecture_local.png'">
If you are running a [local Ethereum node](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum), sending RPC requests to your local node is the preferred way to use Augur.

<aside class="notice">To use "sendTransaction" RPC commands (i.e., anything that requires Ether / is actually sent to the network) you will need to unlock your Ethereum node.  If you are running geth, the easiest way to do this is to start it with the <code>--unlock</code> option:

<code class="block">geth --unlock 0 --rpc --rpccorsdomain "http://localhost:8545" --rpcapi "shh,db,eth,net,web3" --shh --genesis /path/to/genesis_block.json --networkid 7 --bootnodes "enode://70eb80f63946c2b3f65e68311b4419a80c78271c099a7d1f3d8df8cdd8e374934c795d8bc9f204dda21eb9a318d30197ba7593494eb27ceb52663c8339e9cb70@[::]:30303,enode://405e781c84b570f02cb2e4ebb18c60528aba5a08ccd72d4ebd7aeabc09208ef24fa54e20ff3b10e478c203dd481f3820242e51fe72770a207a798eadfe8e7e6e@[::]:30303,enode://d4f4e7fd3954718562544dbf322c0c84d2c87f154dd66a39ea0787a6f74930c42f5d13ba2cfef481b66a6f002bc3915f94964f67251524696a448ba40d1e2b12@[::]:30303,enode://8f3c33294774dc266446e9c8483fa1a21a49b157d2066717fd52e76d00fb4ed771ad215631f9306db2e5a711884fe436bc0ca082684067836b3b54730a6c3995@[::]:30303,enode://4f23a991ea8739bcc5ab52625407fcfddb03ac31a36141184cf9072ff8bf399954bb94ec47e1f653a0b0fea8d88a67fa3147dbe5c56067f39e0bd5125ae0d1f1@[::]:30303,enode://bafc7bbaebf6452dcbf9522a2af30f586b38c72c84922616eacad686ab6aaed2b50f808b3f91dba6a546474fe96b5bff97d51c9b062b4a2e8bc9339d9bb8e186@[::]:30303"</code>
where <code>/path/to/genesis_block.json</code> is the genesis block for the (temporary) Augur private chain.  <a href="http://augur.link/genesis_block.json">Download the genesis block here.</a>
</aside>

Hosted node
-----------
<img src="images/architecture_hosted.svg" onerror="this.src='images/architecture_hosted.png'">
Understandably, many users will not want to go to the trouble of running a full Ethereum node solely for the purpose of using Augur.  Augur maintains five public Ethereum nodes, which are used automatically by [client.augur.net](http://client.augur.net) if a local Ethereum node is not detected:

- [http://eth1.augur.net](http://eth1.augur.net)
- [http://eth2.augur.net](http://eth2.augur.net)
- [http://eth3.augur.net](http://eth3.augur.net)
- [http://eth4.augur.net](http://eth4.augur.net)
- [http://eth5.augur.net](http://eth5.augur.net)

All five nodes are temporarily on a private chain (networkid 7), rather than the main Frontier network, while Augur is in alpha/beta testing.
