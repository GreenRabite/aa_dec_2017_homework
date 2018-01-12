function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block'
    console.log(x);
  }
  console.log(x);
}

function functionName() {
  asdadasd
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
    // var x = 'in block';
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
  // let x = 'out of block again';
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

// fizzBuzz
//
// 3 and 5 are magic numbers.
//
// Define a function fizzBuzz(array) that takes an array and returns
// a new array of every number in the array that is divisible by either
// 3 or 5, but not both.
function fizzBuzz(array){
  var arr = [];
  for (var i = 0; i < array.length; i++){
    if (array[i] % 3 ===0 && array[i] % 5 === 0){
      continue;
    }else if (array[i] % 3 === 0 || array[i] % 5 ===0) {
      arr.push(array[i]);
    }
  }
  return arr;
};

// isPrime
//
// Define a function isPrime(number) that returns true if number is prime.
//  Otherwise, false. Assume number is a positive integer.

function isPrime(number) {
  for (var i = 2; i < number - 1; i++){
    if (number % i ===0){
      return false;
    }
  }
  return true;
};

// sumOfNPrimes
//
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the
// sum of the first n prime numbers. Hint: use isPrime as a helper method.

function firstNPrimes (n){
  var primeArr = [];
  var i = 2;
  while (primeArr.length !== n) {
    if (isPrime(i) === true){
      primeArr.push(i);
    }
    i++;
  }
  return primeArr;
};

function sumOfPrimes(n) {
  let sum = 0;
  var primeArr = firstNPrimes(n);
  for (var i = 0; i < primeArr.length; i++) {
    sum += primeArr[i]
  }
  return sum
};
