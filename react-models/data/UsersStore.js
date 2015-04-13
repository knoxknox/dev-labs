var Backbone = require('backbone');
var UserModel = require('./UserModel');

module.exports = Backbone.Collection.extend({ model: UserModel });
