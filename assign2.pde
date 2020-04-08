PImage restartHovered,restartNormal,startHovered,startNormal,title,gameover; 
PImage bg,soil,life,groundhogIdle,groundhogDown,groundhogLeft,groundhogRight,cabbage,soldier;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_OVER = 3;

final int GROUNDHOG_STEP = 80;


int groundhogX, groundhogY ;
int soldierX, soldierY;
int cabbageX, cabbageY;
int lifeicon = 2 ;


boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


int gameState;




void setup() {
	size(640, 480, P2D);
	  
  //load images
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  startHovered = loadImage("img/startHovered.png");
  startNormal = loadImage("img/startNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  soldier = loadImage("img/soldier.png");
  cabbage = loadImage("img/cabbage.png");
  
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  
  //init variables
  gameState=GAME_START;
  
  
  
  soldierX=0;
  soldierY=floor(random(4))*80+160;
  
  cabbageX = 80*floor(random(0,8));
  cabbageY = 80*floor(random(2,5));


}

void draw() {
    
	switch (gameState){
  
  
    // Game Start
    case GAME_START:
    image(title,0,0);
    image(startNormal,248,360);
     if(mouseY>360 && mouseY<420 && mouseX>248 && mouseX<392){
       if(mousePressed){
         //click
         gameState = GAME_RUN;
       }else{
         //hover
         image(startHovered,248,360);
       }
       groundhogX=320;
       groundhogY=80;
     }
     break;
     
    // Game Run
     case GAME_RUN:
      //put images
      image(bg,0,0);
      image(soil,0,160); //soil
      image(life,10,10); //2 heart
      image(life,80,10);
      //sun
      
      noStroke();
      fill(255,255,0);
      ellipse(590,50,130,130);
      
      noStroke();
      fill(253,184,19);
      ellipse(590,50,120,120);
      
      //Grassland
      stroke(124,204,25);
      strokeWeight(15);
      line(0,152.5,640,152.5);
      
      //soldier
      image(soldier,soldierX,soldierY);
      
      
      //soldierMove
      soldierX=soldierX+5;
      //soldierX%=640;
      if (soldierX > 640){
        soldierX = -100 ;
      }
      
      //groundhogMove
      image(groundhogIdle,groundhogX,groundhogY);
      
      if (upPressed){
        image(groundhogIdle,groundhogX,groundhogY);
        groundhogY-=GROUNDHOG_STEP;
        if(groundhogY<160){
          groundhogY=160;
        }
        upPressed = false;
      }  
      if (downPressed){
        image(groundhogDown,groundhogX,groundhogY);
        groundhogY+=GROUNDHOG_STEP;
        if(groundhogY>height-80){
           groundhogY=height-80;
         }
         downPressed = false;
      }  
      if (leftPressed){
        image(groundhogLeft,groundhogX,groundhogY);
        groundhogX-=GROUNDHOG_STEP;
        if(groundhogX<0){
         groundhogX=0;
         }
         leftPressed = false;
      }  
      if (rightPressed){
        image(groundhogRight,groundhogX,groundhogY);
        groundhogX +=GROUNDHOG_STEP;
        if(groundhogX>width-80){
         groundhogX=width-80;
         }
         rightPressed = false;
      }  
      break;
	// Game Lose
      case GAME_OVER:
       image(gameover, 0, 0);
       image(restartNormal, 248, 360);
       //mouse action
       if(mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420){
           //hover
           image(restartHovered, 248, 360);         
       }
       break;
  }

}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

////////
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
