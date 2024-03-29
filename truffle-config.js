module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",  // localhost
      port: 7545,         // Port Ganache is running on
      network_id: "*"     // Match any network id
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
}