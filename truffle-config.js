module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // Any network (default: none)
    },
  },

  // Configure your compilers
  compilers: {
    solc: {
      optimizer: {
        enabled: false,
        runs: 200
      },
    }
  }
}