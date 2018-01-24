import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSearchGiphys} from './util/api_util';
import { RECEIVE_SEARCH_GIPHYS } from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById('root');
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.RECEIVE_SEARCH_GIPHYS = RECEIVE_SEARCH_GIPHYS;
  window.store=store;
  ReactDOM.render(<Root store={store} />, root);
});
