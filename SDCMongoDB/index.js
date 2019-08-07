const mongoose = require('mongoose');
const connection = mongoose.connect('mongodb://localhost/hostprofiles', { useNewUrlParser: true });

const db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error'));

const hostsSchema = mongoose.Schema({
  name: String,
  description: String,
  interaction: String,
  cohosts: String,
  datejoined: String,
  responserate: String,
  responsetime: String,
  hosturl: String,
  language1: Number,
  language2: Number
})

const Hosts = mongoose.model('Hosts', hostsSchema);

const addEntry = (data) => {
  let host = new Hosts({
    name: data.name,
    descriptions: data.description,
    interaction: data.interaction,
    cohosts: JSON.stringify(data.cohosts),
    datejoined: data.datejoined,
    responserate: data.responserate,
    responsetime: data.responsetime,
    hosturl: data.hosturl,
    language1: data.language1,
    language2: data.language2
  })
  host.save((err, result) => {
    if (err) {
      return console.error(err.message);
    }
    console.log('entry saved');
    mongoose.disconnect();
  })
}

addEntry({
  name: 'jonny joe',
  description: 'a fine fella really',
  interaction: 'usually clothed',
  cohosts: {},
  datejoined: 'June 16, 1900',
  responserate: '100%',
  responsetime: 'he already did',
  hosturl: 'some.url',
  language1: 1,
  language2: -1
});