const createStore = rootReducer => {
  let state;
  let listeners = [];

  const getState = () => state;
  const subscribe = listener => listeners.push(listener);

  const dispatch = action => {
    state = rootReducer(state, action);
    listeners.forEach(listener => listener(state));
  };

  dispatch({});

  return { getState, dispatch, subscribe };
};

export { createStore };
