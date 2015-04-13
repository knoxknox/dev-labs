var React = require('react');
var Observer = require('./Observer.js');

module.exports = React.createClass({
  mixins: [React.Backbone],
  observe: { 'item': 'model' },

  render: function() {
    return <p>{this.props.item.get('name')}</p>;
  }
});
