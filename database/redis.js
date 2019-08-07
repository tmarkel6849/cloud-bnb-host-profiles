const redis = require('redis'),
      client = redis.createClient()

client.on('connect', () => {
  console.log('redis connection open....')
})

client.on('error', (err) => {
  console.log('redis connection error: ' ,err)
})

// client.set(100, 'test value for 100 has changed', redis.print)
// client.get(100, (err, result) => {
//   if ( err ) {
//     return console.error('error retrieving value: ', err)
//   }
//   console.log('the value for key 100 -->> ', result)
//   client.quit()
// })

module.exports = {
  client
}