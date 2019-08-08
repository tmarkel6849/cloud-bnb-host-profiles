const createCsvWriter = require('csv-writer').createObjectCsvWriter,
      hostData = require('../seedData/hosts.js'),
      { pool } = require('../index.js'),
      fs = require('fs')
//! import the entire thing into a variable and access each piece off the reference
let { transactionCount } = require('./seedParams.js'),
    { transaction } = require('./seedParams.js'),
    { transactions } = require('./seedParams.js')

/******************** GLOBAL VARIABLES ********************/

const hostDataEntries = Object.keys(hostData).length,
      path = '../csv/hosts.csv'

/******************** FUNCTIONS TO CREATE ENTRIES ************************/

const hostIdx = () => Math.floor(Math.random() * hostDataEntries);

const hostEntry = () => {
  return {
    name: hostData[ hostIdx() ].name,
    description: hostData[ hostIdx() ].description,
    interaction: hostData[ hostIdx() ].interaction || 'none',
    datejoined: hostData[ hostIdx() ].dateJoined || 'none',
    responserate: hostData[ hostIdx() ].responseRate,
    responsetime: hostData[ hostIdx() ].responseTime,
    hosturl: hostData[ hostIdx() ].hostUrl,
  }
}

/******************* CREATE CSV / IMPORT TO DATABASE *********************/

const csvWriter = createCsvWriter({
  path: '../csv/hosts.csv',
  header: [
    { id: 'name', title: 'name' },
    { id: 'description', title: 'description' },
    { id: 'interaction', title: 'interaction' },
    { id: 'datejoined', title: 'datejoined' },
    { id: 'responserate', titel: 'resposnerate' },
    { id: 'responsetime', title: 'responsetime' },
    { id: 'hosturl', title: 'hosturl' }
  ]
})

const createCsvAndSeed = () => {
  const entries = []
  for ( let i = 0; i < transaction; i++ ) {
    entries.push(hostEntry())
  }
  csvWriter.writeRecords(entries)
    .then(() => {
      console.log('hosts csv created...')
      seedHosts(createCsvAndSeed)
    })
}

const seedHosts = (cb) => {
  const queryString = "COPY hosts(name, description, interaction, datejoined, responserate, responsetime, hosturl) FROM '/Users/trevormarkel/Documents/Galvanize/SDC1/host-profile/SDCpostgreSQL/csv/hosts.csv' DELIMITER ',' CSV HEADER"
  pool.query(queryString, (err, result) => {
    if ( err ) {
      return console.error('error message from hosts seed: ', err.message)
    }
    console.log('hosts table seed #' + transactionCount)
    fs.unlink(path, (err) => {
      if ( err ) {
        return console.error(err.message)
      }
    })
    if ( transactionCount < transactions ) {
      ++transactionCount
      cb()
    }
  })
}

// createCsvAndSeed(transaction)