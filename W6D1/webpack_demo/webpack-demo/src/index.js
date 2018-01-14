import _ from 'lodash';

function component() {
  var element = document.createElement('div');

  // Loadash now imported by a script
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
