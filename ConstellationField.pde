public color[] colors = {color(255, 0, 0), color(0, 128, 0), color(255,255,224), color(255,255,0), color(255, 218, 185), color(0,191,255)};
float dist = 50;
float maxDist = sqrt(2 * pow(dist, 2));

int amount = 200;
Star[] stars = new Star[amount];
Star mouse;

void setup(){
  size(1200, 800);
  //println(maxDist);
  for(int i = 0; i<amount; i++){
    stars[i] = new Star();
  }
  mouse = new Star(mouseX, mouseY);
}

void draw(){
  background(40);
  println(frameRate);
  for(int i = 0; i < amount; i++){
    fill(colors[stars[i].c]);
    for(int j = 0; j<amount; j++){
      if(stars[i].close(stars[j], 1)){
        double d = stars[i].distance(stars[j]);
        
        float Weight = abs(map((float)d, (float)maxDist , 0.0, 0.0, 100));
        
        stroke(255, Weight);
       
        line(stars[i].xpos, stars[i].ypos, stars[j].xpos, stars[j].ypos);
        
      }
    }
    noStroke();
    stars[i].render();
    stars[i].update();
    
  }
  for(int z = 0; z < amount; z++){
    if(mouse.close(stars[z], 2)){
        double d = mouse.distance(stars[z]);
        //float maxDis = sqrt(pow(dist, 2));
        float Weight = abs(map((float)d, (float)maxDist*2, 0.0, 0.0, 100));
        println(Weight);
        //float TestWeight = abs(map(90.0, (float)maxDist, 0.0, 0.0, 1));
        //println(TestWeight);
        stroke(255, Weight);
        //strokeWeight(Weight);
        //println(Weight);
        line(mouse.xpos, mouse.ypos, stars[z].xpos, stars[z].ypos);
        
    }
  }
  mouse.render();
  mouse.update();
}
