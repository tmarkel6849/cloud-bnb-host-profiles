const environment = 'development';
const configuration = require('../knexfile')[environment];
const db = require('knex')(configuration);
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3005;

app.use(cors());

app.use(express.static('public'));
app.use(bodyParser.json());

app.get('/host/id/:id', (req, res) => {
  let data = {};
  db.from('hosts')
    .select()
    .where('id', req.params.id)
    .then((hostData) => {
      data = JSON.parse(JSON.stringify(hostData[0]));
    })
    .catch((err) => {
      res.status(500).json({ err });
    })
    .then(() => {
      db.from('languages')
        .innerJoin('hosts_languages', 'languages.id', '=', 'hosts_languages.language_id')
        .select('language')
        .where('host_id', req.params.id)
        .then((languagesArray) => {
          let langStringsArray = [];
          languagesArray.map((langObj) => {
            langStringsArray.push(langObj.language);
          });
          data.languages = langStringsArray;
          res.status(200).json(data);
        })
        .catch((err) => {
          res.status(500).json({
            err
          });
        });
    });
});

app.listen(port, () => {console.log(`Listening on port ${port}`)});