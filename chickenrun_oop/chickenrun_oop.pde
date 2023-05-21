// global variables
float startY, endY, size;
float laneGap;

int nbrCar = 5;
int life = 3;

final int GAME_START = 1;
final int GAME_WIN = 2;
final int GAME_LOSE = 3;
final int GAME_RUN = 4;
final int DIE = 5;
int gameState;
boolean alive ;
Chicken chicken;
HPUI hpUI;
Car car;
void setup(){
  size(400,400);

  size = 40;
  laneGap = size+10;
  startY = 0;
  endY = laneGap*(nbrCar+1);
  alive = true;
  hpUI = new HPUI();
  car = new Car(nbrCar);
  chicken = new Chicken();
  // start game
  gameState = GAME_START;
}

void draw(){
  switch (gameState){
   case GAME_START:
       background(10,110,16);
       text("Press Enter", width/2, height/2);    
       break;
   case GAME_RUN:
       background(10,110,16);
       
       // start and end area
       fill(4,13,78);
       rect(0,startY,width,laneGap);
       rect(0,endY, width, laneGap);
       
       // show life
       hpUI.showLife();
       
       // show chicken
       chicken.draw();
       
       // check destination 
       if (chicken.isWin()){
            // increase car speed

            gameState = GAME_WIN;
       }

       // show cars & hit detection
       car.move();
       car.draw();
       // hit Test
       if (car.isHit(chicken)){
           //decrease life
             chicken.alive = false;
             life--;
             gameState = DIE;
       }
       break;
   case DIE:
       // check life
       if (life <= 0){
          // reset car speed
          for (int i = 0; i < nbrCar;i++){
            car.carSpeed[i] = random(1,5);
          }
         gameState = GAME_LOSE;
       }
       chicken.draw();
       break;
       
   case GAME_WIN:
       hpUI.display();
       break;
   case GAME_LOSE:
       hpUI.display();   
       break;
  }
}


void keyPressed() {
    if (key == CODED && gameState == GAME_RUN) {
     switch(keyCode) {
     case UP:
       chicken.move(UP);
       break;
     case DOWN:
       chicken.move(DOWN);
       break;
     case LEFT:
       chicken.move(LEFT);
       break;
     case RIGHT:
       chicken.move(RIGHT);
       break;  
     }
    }
    
    if(key==ENTER && gameState != GAME_RUN){
      if (gameState == GAME_LOSE){
         // restart the game
         life=3; 
         chicken.alive = true;
      }
      
       chicken = new Chicken();
       gameState = GAME_RUN;
    }
}
