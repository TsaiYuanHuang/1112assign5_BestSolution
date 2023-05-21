class Car{
  float [] carX, carY, size, carSpeed;
  PImage[] imgCars;
  
  Car(int num){
    // complete the code here
    carX = new float[num];  // Initialize carX array
    size = new float[num];  // Initialize size array
    carSpeed = new float[num];
    imgCars = new PImage[num];
    for (int i=0; i<num; i++){
       imgCars[i] = loadImage("data/car"+i+".png");
       carX[i] = width ;
       carSpeed[i] = random(1,5);
  }
    
    //imgCar = loadImage("data/car"+num+".png");
  }
  
  void move(){
    // complete the code here
     // move cars
     carY = new float[5];
     for (int i=0; i<5; i++){
         carY[i] = (i+1)*laneGap;
         carX[i] -= carSpeed[i];
         // boundary detection
         if (carX[i] < 0){
           carX[i] = width;
         }
  }
  }
  void draw(){
    for (int i = 0;i < 5 ;i++){
      image(imgCars[i], carX[i], carY[i]);
    }
    
  }
  
  boolean isHit(Chicken c){
   for (int i = 0;i < 5 ;i++){
     if (isHit(chicken.x, chicken.y, chicken.size, chicken.size, carX[i], carY[i], chicken.size, chicken.size)){
      return true;
     }
   }
   return false;
} 
  boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh)
  {
    // Collision x-axis?
      boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
      // Collision y-axis?
      boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
      return collisionX && collisionY;
  }
}
