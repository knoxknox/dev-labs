/**
 * Example of react with backbone models/collections.
 * https://github.com/magalhas/backbone-react-component
 */

var React = require('react');
var Records = require('./data/Records.js');
var UsersList = require('./app/UsersList.jsx');

var node = document.querySelector('.app');
React.render(React.createElement(UsersList, {items: users}), node);
