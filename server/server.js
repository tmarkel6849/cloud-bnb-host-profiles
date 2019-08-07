require('newrelic')
require('dotenv').config()

const express = require('express'),
      bodyParser = require('body-parser'),
      cors = require('cors'),
      path = require('path'),
      fs = require('fs'),
      { client } = require('./redis.js'),
      { getLastHostEntry } = require('../SDCpostgreSQL/index.js'),
      { getRandomHost } = require('../SDCpostgreSQL/index.js'),
      { getHost } = require('../SDCpostgreSQL/index.js')

import renderer from './renderer'
import { render } from 'react-testing-library';

const port = process.env.PORT || 3005,
      app = express()

app.use(cors())
app.use(express.static(path.join(__dirname + '/../public')))
app.use(bodyParser.json());app.use(bodyParser.urlencoded())

/************************* SSR ROUTES ****************************/

app.get('/', (req, res) => {
  getRandomHost((props) => {
    fs.readFile('../public/index.html', 'utf8', (err, data) => {
      const html = renderer(data, props)
      res.send(html)
    })
  })
})

app.get('/proxy', (req, res) => {
  let hostId = req.params.hostId
  getHost(hostId, (props) => {
    fs.readFile('../public/proxy.html', 'utf8', (err, data) => {
      if ( err ) {
        console.log('error reading file data: ', err)
        return res.send(500)
      }
      const html = renderer(data, props)
      res.send(html)
    })
  })
})

/****************** WITH REDIS ************************/

// app.get('/proxy', (req, res) => {
//   let id = 99998
//   console.log('at prxy endpoint....')
//   client.get(id, (err, result) => {
//     console.log('checked redis for entry....')
//     if ( err ) {
//       console.error('error in redis cache: ', err)
//       return res.send(500)
//     }
//     if ( result ) {
//       console.log('entry was found in redis....')
//       return res.send(result).status(201)
//     } else {
//       console.log('entry was not found in redis....')
//       getHost(id, (props) => {
//         console.log('got the entry from the database....')
//         fs.readFile('../public/proxy.html', 'utf8', (err, data) => {
//           if ( err ) {
//             return console.error('error reading the file: ', err)
//           }
//           const html = renderer(data, props)
//           client.set(id, html)
//           console.log('entry saved in redis....')
//           res.send(html)
//         })
//       })
//     }
//   })
// })

/********************* ROUTES ACCESSING POSTGRES ************************/

app.get('/postgres/lastentry', (req, res) => {
  getLastHostEntry((data) => {
    if ( !data ) {
      console.log('error retrieving last entry')
      return res.send(400)
    }
    return res.send(data)
  })
})

app.get('/postgres/randomentry', (req, res) => {
  getRandomHost((data) => {
    if ( !data ) {
      console.log('error retrieving random entry')
      return res.send(400)
    }
    return res.send(data)
  })
})

app.get('./postgres/host', (req, res) => {
  getHost(req.body, ()=> {
    if ( !data ) {
      console.error('error retrieveing host')
      res.send(400)
    }
    return res.send(data)
  })
})

/******************** HEY! LISTIN!! **********************/

app.listen(port, () => {
  console.log(`listening on port ${port}`)
})