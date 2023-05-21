class HPUI{
  PImage imgEgg, imgWin, imgLose;

  
  HPUI(){
    // images
    imgEgg = loadImage("data/egg.png");
    imgWin = loadImage("data/win.png");
    imgLose = loadImage("data/lose.png");
    // fonts
    textFont(createFont("font/Square_One.ttf", 20));  
    textAlign(CENTER);
  }

  void showLife(){
     for(int i=0;i<life;i++){
         image(imgEgg,i*imgEgg.width,height-laneGap);
     }  
  }
  
  void display(){
     PImage img = null;
     String message = null;
     switch (gameState){
       case GAME_WIN:
         img = imgWin;
         message = "You win!!";
         break;
       case GAME_LOSE:
         img = imgLose;
         message = "You Lose!!";
     }
     background(0);
     image(img,width/4,height/4);
     fill(255);
     text(message,width/2,height/4);
  }

}
