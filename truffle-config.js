const HDWallet = require('truffle-hdwallet-provider');
const fs = require('fs');
const mnemonic = fs.readFileSync(".mnemonic.door").toString().trim();
const infuraKey = fs.readFileSync(".infura.door").toString().trim();

const rpcHost = process.env.RPC_HOST;
const rpcPort = process.env.RPC_PORT;
const networkId = process.env.NETWORK_ID;
const url = process.env.RPC_URL;

module.exports = {
  networks: {
    contracts_build_directory: "./build/contracts",

    development: {
      host:  rpcHost || "127.0.0.1",
      port: rpcPort || 7545,
      network_id: networkId || 5777,
      gas: 6000000,
      gasPrice: 20000000000,
      websockets: true
    },

    fluid: {
      host: "127.0.0.1",
      port: rpcPort || 7535,
      network_id: networkId || 12,
      gas: 6000000, //energy
      gasPrice: 20000000000, //matter
      websockets: true
    },

    ropsten: {
      provider: () => new HDWalletProvider(mnemonic, `https://ropsten.infura.io/${infuraKey}`),
      network_id: 3,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    }
  },

  mocha: {
    timeout: 100000
  },

  compilers: {
    solc: {
      version: "0.5.1",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  }
}
