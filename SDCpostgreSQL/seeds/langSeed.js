const { pool } = require('../index.js');
const languages = require('../../db/languages.js');

seedLanguages = () => {
  let queryString = 'INSERT INTO languages (language) VALUES ($1)';
  for ( let lang of languages ) {
    pool.query(queryString, [lang.language], (err, result) => {
      if ( err ) {
        return console.error(err.message);
      }
    })
    console.log('languages table seeded...');
  }
}

// seedLanguages()