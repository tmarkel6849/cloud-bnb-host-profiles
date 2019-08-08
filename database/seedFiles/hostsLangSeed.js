const createCsvWriter = require('csv-writer').createObjectCsvWriter,
      fs = require('fs'),
      languages = require('../seedData/languages.js'),
      { pool } = require('../index.js')
//! import the entire thing into a variable and access each piece off the reference
let { lastSeededJoin } = require('./seedParams.js'),
    { transactionCount } = require('./seedParams.js'),
    { transaction } = require('./seedParams.js'),
    { transactions } = require('./seedParams.js')

/*********************** Global Variables ***********************/

const totalLanguages = Object.keys(languages).length,
      maxLanguages = 2,
      path = '../csv/hostLangs.csv'

/*********************** FUNCTIONS TO CREATE RANDOM ENTRIES *************************/

const languageIdx = () => {
  return Math.ceil(Math.random() * totalLanguages)
}

const hostSpokenLanguages = () => {
  return Math.ceil(Math.random() * maxLanguages)
}

const hostLanguageEntry = (host_id, firstLanguage) => {
  let lang_id = languageIdx()
  if ( firstLanguage !== undefined ) {
    while (firstLanguage === lang_id ) {
      lang_id = languageIdx()
    }
  }
  return { host_id, lang_id }
}

/************************* WRITE ENTRIES TO CSV *************************/

const csvWriter = createCsvWriter({
  path: '../csv/hostLangs.csv',
  header: [
    { id: 'host_id', title: 'host_id' },
    { id: 'lang_id', title: 'lang_id' }
  ]
})

const createCsvAndSeed = (lastSeededJoin) => {
  let entries = [],
      firstLanguage,
      spokenLanguages
  for ( let i = 0; i <= transaction; i++ ) {
    spokenLanguages = hostSpokenLanguages()
    if ( spokenLanguages === 1 ) {
      entries.push(hostLanguageEntry(lastSeededJoin))
    } else if ( spokenLanguages === 2 ) {
      firstLanguage = hostLanguageEntry(lastSeededJoin)
      entries.push(firstLanguage)
      entries.push(hostLanguageEntry(lastSeededJoin, firstLanguage.lang_id))
    }
    ++lastSeededJoin
  }
  csvWriter.writeRecords(entries)
  .then(() => {
    console.log('hostLangs csv created...')
    seedHostLangs(createCsvAndSeed, lastSeededJoin)
  })
}


/********************** SEEDS DATABASE TABLE *********************/

const seedHostLangs = (cb, lastSeededJoin) => {
  const queryString = "COPY hostLangs(host_id, lang_id) FROM '/Users/trevormarkel/Documents/Galvanize/SDC1/host-profile/SDCpostgreSQL/csv/hostLangs.csv' DELIMITER ',' CSV HEADER"
  pool.query(queryString, (err) => {
    if ( err ) {
      return console.error('error from hostslang seed: ' ,err.message)
    }
    console.log('hostLangs table seed #' + transactionCount)
    fs.unlink(path, (err) => {
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