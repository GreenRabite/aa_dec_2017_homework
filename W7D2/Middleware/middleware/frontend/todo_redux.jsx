import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  store.dispatch = addLoggingToDispatch(store);
  window.store = store;

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = (store) => {
  let dispatchValue = store.dispatch;
  return ((action) => {
    console.log(store.getState());
    console.log(action);
    dispatchValue(action);
    console.log(store.getState());
  });
};
