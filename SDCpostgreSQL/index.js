require('dotenv').config()
const { Pool } = require('pg'),
      { totalHosts } = require('./seeds/seeder.js')

/******************* DATABASE CONNECTION ********************/

const pool =  new Pool ({
  connectionString: 'postgresql://postgres:sdc@ec2-52-27-91-99.us-west-2.compute.amazonaws.com:5432/hostprofiles'
})

/******************* HELPER FUNCTION ***********************/

const formatData = (array, host_id) => {
  let data = { cohosts: {}, languages: {} },
      cohosts = 0,
      languages = 0
  for ( let arr of array ) {
    for ( let obj of arr ) {
      if ( !obj.language ) {
        if ( obj.id === host_id ) {
          data.host = obj
        } else {
          data.cohosts[`cohost${++cohosts}`] = {
            name: obj.name,
            datejoined: obj.datejoined,
            hosturl: obj.hosturl
          }
        }
      } else {
        data.languages[`language${++languages}`] = obj.language
      }
    }
  }
  return data
}

const weightedRandomHost = () => {
  let rand = Math.random() * 19.368,
      block, weightedHostId

  block = rand > 9.14 ? 10 : rand > 4.61 ? 9 : rand > 2.44 ? 8 : rand > 1.32 ? 7 : rand > 0.70 ? 6 :
    rand > 0.36 ? 5 : rand > 0.16 ? 4 : rand > 0.06 ? 3 : rand > 0.01 ? 2 : 1,

  weightedHostId = Math.ceil(Math.random() * 1000000) + (block - 1) * 1000000;

  return weightedHostId
}

/******************* QUERY FUNCTIONS **********************/

const getLastHostEntry = (cb) => {
  const hostsQueryString = `SELECT DISTINCT hosts.id, hosts.name, hosts.description, hosts.interaction, hosts.datejoined, hosts.responserate, hosts.responsetime, hosts.hosturl FROM hosts INNER JOIN cohosts ON cohosts.host_id=$1 WHERE hosts.id=$1 OR hosts.id=cohosts.cohost_id;`,
        langQueryString = `SELECT DISTINCT languages.language FROM languages INNER JOIN hostlangs ON hostlangs.host_id=$1 WHERE languages.id=hostlangs.lang_id;`
  let data, formattedData

  pool.query(hostsQueryString, [ totalHosts ], (err, result1) => {
    if ( err ) {
      return console.error(err.message)
    }
    pool.query(langQueryString, [ totalHosts ], (err, result2) => {
      if ( err ) {
        return console.error(err.message)
      }
      data = [ result1.rows, result2.rows ]
      formattedData = formatData(data, totalHosts)
      cb(formattedData)
    })
  })
}

const getRandomHost = (cb) => {
  const hostsQueryString = `SELECT DISTINCT hosts.id, hosts.name, hosts.description, hosts.interaction, hosts.datejoined, hosts.responserate, hosts.responsetime, hosts.hosturl FROM hosts INNER JOIN cohosts ON cohosts.host_id=$1 WHERE hosts.id=$1 OR hosts.id=cohosts.cohost_id;`,
        langQueryString = `SELECT languages.language FROM languages INNER JOIN hostlangs ON hostlangs.host_id=$1 WHERE languages.id=hostlangs.lang_id;`,
        randomHostId = weightedRandomHost()
  let data, formattedData;

  pool.query(hostsQueryString, [ randomHostId ], (err, result1) => {
    if ( err ) {
      console.error(err.message)
    }
    pool.query(langQueryString, [ randomHostId ], (err, result2) => {
      if ( err ) {
        return console.error(err.message)
      }
      data = [ result1.rows, result2.rows ]
      formattedData = formatData(data, randomHostId)
      cb(formattedData)
    })
  })
}

const getHost = (host, cb) => {
  const hostsQueryString = `SELECT DISTINCT hosts.id, hosts.name, hosts.description, hosts.interaction, hosts.datejoined, hosts.responserate, hosts.responsetime, hosts.hosturl FROM hosts INNER JOIN cohosts ON cohosts.host_id=$1 WHERE hosts.id=$1 OR hosts.id=cohosts.cohost_id;`,
    langQueryString = `SELECT languages.language FROM languages INNER JOIN hostlangs ON hostlangs.host_id=$1 WHERE languages.id=hostlangs.lang_id;`
  let data, formattedData;

  pool.query(hostsQueryString, [ host], (err, result1) => {
    if ( err ) {
      console.error(err.message)
    }
    pool.query(langQueryString, [ host ], (err, result2) => {
      if ( err ) {
        return console.error(err.message)
      }
      data = [ result1.rows, result2.rows ]
      formattedData = formatData(data, host)
      cb(formattedData)
    })
  })
}

/******************* EXPORTS *******************/

module.exports = {
  pool,
  getLastHostEntry,
  getRandomHost,
  getHost
}