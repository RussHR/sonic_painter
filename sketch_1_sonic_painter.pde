void setup() {
  background(0);
  size(800, 600, P3D);
  rectMode(CENTER);
}

void mouseDragged() {
  // find rgb red
  float red = map(mouseX, 0, width, 0, 255);
  // find rgb green
  float green = map(mouseY, 0, width, 0, 255);
  //find rgb blue
  float blue = dist(mouseX, mouseY, width/2, height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  // the faster the speed, the thinner the width
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 20);
   
  // each stroke draws a translucent, dark rectangle
  // over the canvas 
  float alpha = map(speed, 0, 20, 0, 2);
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  noFill();

  float quadMod = map(speed, 0, 10, 0.1, 1);
  
  quad(
    mouseX, mouseY, 
    mouseX + random(-10*quadMod, 10*quadMod), mouseY + random(-10*quadMod, 10*quadMod),
    mouseX + random(-10*quadMod, 10*quadMod), mouseY + random(-10*quadMod, 10*quadMod),
    mouseX + random(-10*quadMod, 10*quadMod), mouseY + random(-10*quadMod, 10*quadMod)
  );
}
