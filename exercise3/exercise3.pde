PImage restart;
float a = 0.0;
float inc=TWO_PI/300;
final int GAME_START=0;
final int GAME_OVER=1;
int gameState=GAME_START;
void setup()
{
  size(480,480);
  restart=loadImage("img/restart.png");
  rectMode(CORNERS);
}

void draw(){
  switch(gameState){
    case GAME_START:
    background(255);
    a=a+inc;
    for(float x = 0 ; x<width ; x=x+40){          
      if(x==0 || x==440){
        fill(255); 
        noStroke();
        rect(0,0,40,height);
        rect(440,0,480, height);
      }else{
        stroke(0);  
        fill(0,0,255);
        rect(x,0,x+40, 200+sin(x/40-a)*20.0);
        rect(x, 280+sin(x/40-a)*20.0,x+40,height);
      }
      if(mouseX>25 && mouseX<465){
         if(mouseY<200+sin(x/40-a)*20.0||mouseY>280+sin(x/40-a)*20.0){
        gameState=GAME_OVER;
        break;
        }                
       }
       
  fill(0,255,0);
  stroke(0);
  ellipse(mouseX, mouseY, 30,30);
  }    
  break;
  case GAME_OVER:
  background(255);
  image(restart,0,0);
  if(mouseX<=40 && mouseY<=40){
    if(mousePressed){
      gameState=GAME_START;
    }
  }
  break;
  } 
}
