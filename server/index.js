require('dotenv').config()

const express = require('express'),
      bodyParser = require('body-parser'),
      cors = require('cors'),
      path = require('path'),
      fs = require('fs'),
      db = require('../database/index.js'),
      { client } = require('../database/redis.js')

const PORT = process.env.PORT || 3005,
      app = express()

/***************** UNCOMMENT TO COMPILE FOR SSR ******************/

// import renderer from './renderer'

/************************* MIDDLEWARE ****************************/

app.use(cors())
app.use(express.static(path.join(__dirname + '../public')))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

/********************* SSR ROUTES FOR PROXY ************************/

app.get('/proxy:id', (req, res) => {
  db.getHost(req.params.id, (props) => {
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

app.get('/proxy/randomentry', (req, res) => {
  db.getRandomHost((data) => {
    data ? res.send(data) : res.sendStatus(400)
  })
})

/****************** WITH REDIS CACHE ************************/

app.get('/cache:id', (req, res) => {
  client.get(req.params.id, (err, result) => {
    if ( err ) {
      res.send(500)
    } else if ( result ) {
      res.send(result).status(201)
    } else {
      db.getHost(id, (props) => {
        fs.readFile('../public/proxy.html', 'utf8', (err, data) => {
          if ( err ) {
            return console.error('error reading the file: ', err)
          }
          const html = renderer(data, props)
          client.set(id, html)
          res.send(html)
        })
      })
    }
  })
})

/********************* ROUTES ACCESSING DATABASE ************************/

app.get('/host:id', (req, res) => {
  db.getHost(req.params.id, (data) => {
    data ? res.send(data) : res.sendStatus(400)
  })
})

app.get('/lastentry', (req, res) => {
  db.getLastHostEntry((data) => {
    data ? res.send(data) : res.sendStatus(400)
  })
})

app.get('/randomentry', (req, res) => {
  db.getRandomHost((data) => {
    data ? res.send(data) : res.sendStatus(400)
  })
})

/******************** HEY! LISTIN!! **********************/

app.listen(PORT, (err) => {
  err ? console.log('error starting server: ', err) : console.log(`listening on ${PORT}....`)
})