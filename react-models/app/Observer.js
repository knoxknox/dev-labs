var React = require('react');
var _ = require('underscore');

React.Backbone = {

  componentDidMount: function() {
    this.listenToProps(this.props);
  },

  componentWillUnmount: function() {
    this.stopListening();
  },

  componentWillReceiveProps: function(nextProps) {
    this.stopListening();
    this.listenToProps(nextProps);
  },

  listenToProps: function(props) {
    _.each(this.observe, function(events, propName) {
      switch(events) {
        case 'model':
          events = 'change';
          break;
        case 'collection':
          events = 'add sort reset remove';
          break;
      }

      this.listenTo(props[propName], events, function() { this.forceUpdate(); });
    }, this);
  }

};

_.extend(React.Backbone, require('backbone').Events);
