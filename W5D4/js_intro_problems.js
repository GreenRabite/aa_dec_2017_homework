function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log(mysteryScoping1());
// both console.log returns 'in block'
// it mean var x is changed through out even after it exits the callback

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// console.log(mysteryScoping2);
// displays in block first, then out of block
// means that the const x stays in there own scope and disappears when it ends

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// Error: duplication declartaion for x (first const trying to ressign as var x)

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// let also allow x to stay in their respective scope

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// Error: duplication declartaion for x (second let trying to ressign as same scope as let x)

function madLib(verb, adjective, noun){
  return `We shall ${verb} the ${adjective} ${noun}`
}

function isSubstring(searchString, subString){
  var strArr = searchString.split(" ");
  return strArr.includes(subString);
}

// > isSubstring("time to program", "time")
// true
//
// > isSubstring("Jump for joy", "joys")
// false

function fizzBuzz(array) {
  var arr = []
  array.forEach(function (num) {
    if ((num % 3 === 0) || (num % 5 === 0)) && (num )
  }
});
