const hostsData = require('../hosts');
const langData = require('../languages');
const hosts_langData = require('../hosts_langs.js');
const listingsData = require('../listings');

exports.seed = function(knex, Promise) {
  return knex('hosts_languages').del()
    .then(() => knex('hosts').del())
    .then(() => knex('listings').del())
    .then(() => knex('languages').del())
    .then(() => {
      return Promise.all(langData.map((lang) => {
        return knex('languages').insert(lang);
      }));
    })
    .then(() => {
      return Promise.all(hostsData.map((host) => {
        return knex('hosts').insert(host);
      }));
    })
    .then(() => {
      return Promise.all(hosts_langData.map((host_lang) => {
        return knex('hosts_languages').insert(host_lang);
      }));
    })
    .then(() => {
      return Promise.all(listingsData.map((listing, i) => {
        listing.host_id = i + 1;
        return knex('listings').insert(listing);
      }));
    })
    .catch(console.log);
};
