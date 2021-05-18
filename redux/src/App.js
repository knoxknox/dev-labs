import React from 'react';
import PropTypes from 'prop-types';
import { connect } from './redux/connect';
import { increment, decrement } from './flow/actions';

const App = (props) => (
  <div>
    <p>
      <b>{props.counter}</b>
    </p>
    <button onClick={props.increment}>Increment</button>
    <button onClick={props.decrement}>Decrement</button>
  </div>
);

const mapStateToProps = state => ({
  counter: state.counter
});

const mapDispatchToProps = dispatch => ({
  increment: () => dispatch(increment()),
  decrement: () => dispatch(decrement())
});

App.propTypes = {
  counter: PropTypes.number.isRequired,
  increment: PropTypes.func.isRequired,
  decrement: PropTypes.func.isRequired
};

export default connect(mapStateToProps, mapDispatchToProps)(App);
