import { createStore } from 'redux';
import combineReducers from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(combineReducers);
};

export default configureStore;
