require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config()

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.0",
  networks: {
      // localhost: {
      //     url: "http://127.0.0.1:8545"
      // },
      hardhat: {},
      testnet: {
          url: "https://data-seed-prebsc-1-s1.binance.org:8545",
          chainId: 97,
          gasPrice: 20000000000,
          accounts: [process.env.TESTNET_PRIV]
      },
      mainnet: {
          url: process.env.RPC_MAINNET_URL,
          chainId: 56,
          gasPrice: 5000000000,
          gas: 9000000,
          accounts: [process.env.PRIVATE_KEY_MAINET]
      }
  },
  settings: {
      optimizer: {
          enabled: true,
          runs: 200,
      },
  },
  etherscan: {
      // Your API key for Etherscan
      // Obtain one at https://etherscan.io/
      apiKey: process.env.ETHERSCAN_API_KEY
  }, 
};
