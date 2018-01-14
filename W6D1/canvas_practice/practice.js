document.addEventListener("DOMContentLoaded", function(){
  // Phase I: Setting up your Canvas Element
  let canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');
  // Phase II: Draw a Rectangle
  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(10, 10, 55, 50);
  // Phase III: Draw a circle
  ctx.beginPath();
  ctx.arc(50, 50, 20, 0 , 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'rgb(0,200,0)';
  ctx.fill();
  // Phase IV: Draw Our Own Shape
  ctx.beginPath();
  ctx.strokeStyle = 'black';
  ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.fillStyle = 'yellow';
  ctx.fill();
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
  ctx.stroke();
});
