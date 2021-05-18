import React from 'react';

const Context = React.createContext('redux');

const Provider = ({ store, children }) => (
  <Context.Provider value={store}>{children}</Context.Provider>
);

export { Context, Provider };
