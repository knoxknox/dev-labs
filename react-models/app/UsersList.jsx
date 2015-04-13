var React = require('react');
var Observer = require('./Observer.js');
var UserItem = require('./UserItem.jsx');

module.exports = React.createClass({
  mixins: [React.Backbone],
  observe: { 'items': 'collection' },

  render: function() {
    return <p>{this.renderItems()}</p>;
  },

  renderItems: function() {
    return this.props.items.map(function(item) {
      return <UserItem key={item.cid} item={item} />
    });
  }
});
