Maxim maxim;
AudioPlayer freed;
AudioPlayer aura;

void setup() {
  background(0);
  size(800, 600);
  rectMode(CENTER);
  
  maxim = new Maxim(this);
  freed = maxim.loadFile("freed.wav");
  freed.setLooping(true);
  aura = maxim.loadFile("aura.wav");
  aura.setLooping(true);
  
  freed.volume(0.2);
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
  float lineWidth = map(speed, 0, 20, 10, 1);
  lineWidth = constrain(lineWidth, 0, 20);
   
  // each stroke draws a translucent, dark rectangle
  // over the canvas 
  float alpha = map(speed, 0, 20, 0, 5);
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  noFill();

  quadDraw(mouseX, mouseY, speed);

  freed.play();
  aura.play();
  
  freed.ramp(1, 1000);
  aura.ramp(1, 1000);
  aura.speed((float) 50/dist(mouseX, mouseY, width/2, height/2));
  
  freed.setFilter(map(dist(mouseX, mouseY, width/2, height/2), 0, 500, 50, 5000), 1);
}

void quadDraw(float x, float y, float speed) {
  float quadMod = map(speed, 0, 20, 0.1, 1);
  float randModx1 = random(-10*quadMod, 10*quadMod);
  float randModx2 = random(-10*quadMod, 10*quadMod);
  float randModx3 = random(-10*quadMod, 10*quadMod);
  float randMody1 = random(-10*quadMod, 10*quadMod);
  float randMody2 = random(-10*quadMod, 10*quadMod);
  float randMody3 = random(-10*quadMod, 10*quadMod);
  
  quad(
    mouseX, mouseY, 
    mouseX + randModx1, mouseY + randMody1,
    mouseX + randModx2, mouseY + randMody2,
    mouseX + randModx3, mouseY + randMody3
  );
  
  quad(
    width/2+((width/2)-mouseX), height/2+((height/2)-mouseY), 
    width/2+((width/2)-mouseX) - randModx1, height/2+((height/2)-mouseY) - randMody1,
    width/2+((width/2)-mouseX) - randModx2, height/2+((height/2)-mouseY) - randMody2,
    width/2+((width/2)-mouseX) - randModx3, height/2+((height/2)-mouseY) - randMody3
  );
  
  quad(
    width/2+((width/2)-mouseX), mouseY, 
    width/2+((width/2)-mouseX) - randModx1, mouseY + randMody1,
    width/2+((width/2)-mouseX) - randModx2, mouseY + randMody2,
    width/2+((width/2)-mouseX) - randModx3, mouseY + randMody3
  );
  
  quad(
    mouseX, height/2+((height/2)-mouseY), 
    mouseX + randModx1, height/2+((height/2)-mouseY) - randMody1,
    mouseX + randModx2, height/2+((height/2)-mouseY) - randMody2,
    mouseX + randModx3, height/2+((height/2)-mouseY) - randMody3
  );
  
}

void mouseReleased() {
  freed.ramp(0, 5000);
  aura.ramp(0, 1000);
}

