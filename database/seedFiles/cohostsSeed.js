const createCsvWriter = require('csv-writer').createObjectCsvWriter,
      { pool } = require('../index.js'),
      fs = require('fs')
//! import the entire thing into a variable and access each piece off the reference
const { lastSeededJoin } = require('./seedParams.js'),
    { transactionCount } = require('./seedParams.js'),
    { totalHosts } = require('./seedParams.js'),
    { transaction } = require('./seedParams.js'),
    { transactions } = require('./seedParams.js')

/*********************** GLOBAL VARIABLES ************************/

const maxCohosts = 2,
      path = '../csv/cohosts.csv'

/*********************** FUNCTIONS TO CREATE ENTRIES *************************/

const numberOfCohosts = () => {
  return Math.floor(Math.random() * (maxCohosts+1))
}

const coHostIdx = (currentHostId, firstCohost) => {
  let randomIdx = Math.ceil(Math.random() * totalHosts)
  while( true ) {
    if ( randomIdx === currentHostId ) {
      randomIdx = Math.ceil(Math.random() * totalHosts)
    } else if ( randomIdx === firstCohost ) {
      randomIdx = Math.ceil(Math.random() * totalHosts)
    } else {
      break
    }
  }
  return randomIdx
}

const cohostEntry = (host_id, firstCohost) => {
  let cohost_id = coHostIdx(host_id, firstCohost)
  return { host_id, cohost_id }
}

/*********************** WRITE ENTRIES TO CSV *************************/

const csvWriter = createCsvWriter({
  path: '../csv/cohosts.csv',
  header: [
    { id: 'host_id', title: 'host_id' },
    { id: 'cohost_id', title: 'cohost_id' }
  ]
})

const createCsvAndSeed = (lastSeededJoin) => {
  let entries = [],
      firstCohost,
      numOfCohosts
  for ( let i = 0; i < transaction; i++ ) {
    numOfCohosts = numberOfCohosts()
    if ( numOfCohosts === 0 ) {
      entries.push({ host_id: lastSeededJoin, cohost_id: 0 })
    } else if ( numOfCohosts === 1 ) {
      entries.push(cohostEntry(lastSeededJoin))
    } else if ( numOfCohosts === 2 ) {
      firstCohost = cohostEntry(lastSeededJoin)
      entries.push(firstCohost)
      entries.push(cohostEntry(lastSeededJoin, firstCohost.cohost_id))
    }
    lastSeededJoin++
  }
  csvWriter.writeRecords(entries)
  .then(() => {
    console.log('cohosts csv written...')
    seedCohosts(createCsvAndSeed, lastSeededJoin)
  })
}

const seedCohosts = (cb, lastSeededJoin) => {
  const queryString = "COPY cohosts(host_id, cohost_id) FROM '/Users/trevormarkel/Documents/Galvanize/SDC1/host-profile/SDCpostgreSQL/csv/cohosts.csv' DELIMITER ',' CSV HEADER"
  pool.query(queryString, (err, result) => {
    if ( err ) {
      return console.error('error for cohosts seed: ', err.message)
    }
    console.log('cohosts table seeded #' + transactionCount)
    fs.unlink(path, ( err ) => {
      if ( err ) {
        return console.error(err.message)
      }
    })
    if ( transactionCount < transactions ) {
      ++transactionCount
      cb(lastSeededJoin)
    }
  })
}

// createCsvAndSeed(lastSeededJoin)