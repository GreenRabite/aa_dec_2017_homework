function soundMaker(sound, times){

  function makeSound(){
    console.log(`${sound}`);
  }
  //closure
  for(let i = 0; i < times; i++){
    makeSound();
  }
}

// soundMaker("woof",5);

function summation(arr){
  let sum = 1;

  // closure
  function summer(){
    for(let i=0; i < arr.length; i++){
      sum*= arr[i]
    }
  }
  summer();
  return sum;
}

// console.log(summation([1,2,3,4]));

let callback = function(){
  console.log("It has been 5 seconds!")
}
let timeToWait = 5000; // ms

// global.setTimeout(callback, timeToWait);

// more likely to see:
// ES5 styling
// global.setTimeout(function(){
//   console.log("It has been 5 seconds!")
// }, 5000);

// ES6 styling
global.setTimeout(() => {
  console.log("It has been 5 seconds!")
},5000);
