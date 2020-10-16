class Star{
  double xV;
  double yV;
  float xpos;
  float ypos;
  float size;
  float maxSpeed = 0.2;
  int c;
  boolean mousey;
  float dist = 70;
  
  Star(){
   xV = random(-maxSpeed, maxSpeed);
   yV = random(-maxSpeed, maxSpeed);
   xpos = random(0,1280);
   ypos = random(0,800);
   size = random(5, 9);
   c =(int)random(colors.length);
   mousey = false;
  }
  
  Star(int xpos1, int ypos1){
   size = 0;
   xV = 0;
   yV = 0;
   xpos = xpos1;
   ypos = ypos1;
   mousey = true;
    
  }
  
  void update(){
    if(!mousey){
      xpos += xV;
      ypos += yV;
      if(xpos > 1280 || xpos < -10){
         xV = -xV; 
      }
      if(ypos > 800 + 10 || ypos < -10){
         yV = -yV; 
      }
    }
    else{
     xpos = mouseX;
     ypos = mouseY;
    }
  }
  
  void render(){
    ellipse(xpos, ypos, size, size);
  }
  
  boolean close(Star other, double mag){
      if(distance(other) <= maxDist * mag ){
      return true; 
     }
   else{
     return false;
   }
  }
  
  double distance(Star other){
    return sqrt(pow(other.xpos - xpos, 2.0) + pow(other.ypos - ypos, 2.0)); 
  }
  
  
}
