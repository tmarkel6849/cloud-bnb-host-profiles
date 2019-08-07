exports.up = function (knex, Promise) {
  return Promise.all([
    knex.schema.createTable('hosts', (table) => {
      table.increments('id').primary();
      table.string('name', 60);
      table.string('description', 1000);
      table.string('interaction', 1000);
      table.json('coHosts');
      table.string('dateJoined', 16);
      table.string('responseRate', 4);
      table.string('responseTime', 40);
      table.string('hostUrl');
    }),
    knex.schema.createTable('languages', (table) => {
      table.increments('id').primary();
      table.string('language');
    }),
    knex.schema.createTable('hosts_languages', (table) => {
      table.increments('id').primary();
      table.integer('host_id');
      table.foreign('host_id').references('hosts.id');
      table.integer('language_id');
      table.foreign('language_id').references('languages.id');
    }),
    knex.schema.createTable('listings', (table) => {
      table.increments('id').primary();
      table.string('title');
      table.string('description', 1000);
      table.string('type');
      table.string('cost');
      table.integer('capacity');
      table.integer('bedrooms');
      table.integer('beds');
      table.string('baths');
      table.string('photoUrl');
      table.string('city');
      table.string('state');
      table.string('country');
      table.integer('host_id');
      table.foreign('host_id').references('hosts.id');
    })
  ]);
};

exports.down = function (knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('listings'),
    knex.schema.dropTable('hosts_languages'),
    knex.schema.dropTable('languages'),
    knex.schema.dropTable('hosts')
  ]);
};
