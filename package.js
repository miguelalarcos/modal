Package.describe({
  name: 'miguelalarcos:modal',
  version: '0.4.3',
  summary: 'A modal package for Meteor.',
  git: 'https://github.com/miguelalarcos/modal.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.3.1');
  api.use('coffeescript', 'client');
  api.use('templating', 'client');
  api.use('tracker', 'client');
  api.use('reactive-var', 'client');
  api.addFiles('modal.html', 'client');
  api.addFiles('modal.coffee', 'client');
  api.addFiles('modal.css', 'client');
  api.export('modal', 'client');
});

