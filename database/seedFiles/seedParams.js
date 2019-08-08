/******************** GLOBAL VARIABLES **********************/

let lastSeededHost = 0,
    lastSeededJoin = 1,
    totalHosts = 10000000,
    transactionCount = 1,
    transactions = 100,
    transaction = 100001

/******************** SEND THEM OUT TO THE WORLD +++++++++++++++*/

module.exports = {
  lastSeededHost,
  lastSeededJoin,
  totalHosts,
  transactionCount,
  transactions,
  transaction
}