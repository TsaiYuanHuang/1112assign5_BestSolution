class Chicken{
  float x, y, size;
  boolean alive;
  PImage imgChicken, imgGhost;
  
  Chicken(){
    // complete the code here
    
    x = width/2;
    y = 0;

    alive = true;
    size = 40;
    imgChicken = loadImage("data/chicken.png");
    imgGhost = loadImage("data/ghost.png");
  }
  
  boolean isWin(){
    // complete the code here
    //if y reaches destination
    if (y >= endY){
       return true;
    }else{
       return false;
    }
  
  }
    
  void move(int direction){
    // complete the code here
    if (direction == 38){
        y -= laneGap;
    }
   if (direction == 40){
        y += laneGap;
    }
    if (direction == 37){
        x -= laneGap;
    }
    if (direction == 39){
        x += laneGap;
    }
    // boundary
    x = (x<0) ? 0 : x;
    x = (x>width-laneGap) ? width-laneGap : x;
    y = (y<0) ? 0 : y;
    y = (y>height) ? height : y;
  }
  
  void draw(){
    if (alive){
      image(imgChicken, x, y);
    }else{
      image(imgGhost, x, y);
    }
  }
  
}
