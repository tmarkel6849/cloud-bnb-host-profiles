
module.exports = {

  development: {
    client: 'pg',
    connection: {
      host: 'rpropridbinstance.cjx6zdqr2ner.us-west-1.rds.amazonaws.com',
      user: 'rpropri',
      password: 'p*nK+0Wn',
      database: 'airbnb_hosts'
    },
    pool: { min: 0, max: 7 },
    migrations: {
      directory: __dirname + '/db/migrations',
    },
    seeds: {
      directory: __dirname + '/db/seeds',
    }
  },
  production: {
    client: 'pg',
    connection: {
      host: 'rpropridbinstance.cjx6zdqr2ner.us-west-1.rds.amazonaws.com',
      user: 'rpropri',
      password: 'p*nK+0Wn',
      database: 'airbnb_hosts'
    },
    pool: { min: 0, max: 7 }
  }
};