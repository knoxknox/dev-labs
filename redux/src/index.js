import React from 'react';
import ReactDOM from 'react-dom';

import App from './App';
import reducer from './flow/reducer';

import { Provider } from './redux/provider';
import { createStore } from './redux/createStore';
import { combineReducers } from './redux/combineReducers';

const reducers = { counter: reducer };
const store = createStore(combineReducers(reducers));

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
