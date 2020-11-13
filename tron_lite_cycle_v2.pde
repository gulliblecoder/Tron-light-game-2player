//arrow keys to draw
int x1, y1;
int x2, y2;
int speedY1 = 0;
int speedX1 = 1;
int speedY2 = 0;
int speedX2 = 1;
int deltaX1, deltaY1;
int deltaX2, deltaY2;
boolean dead1;
boolean dead2;

void setup() {
  size(500, 500); 
  background(255, 255, 255);  //background white
  
  x1=150;  //start player1
  y1=150;
  
  x2=250;  //start player 2
  y2=250;
  
  deltaX1 = 1;
  deltaY1 = 0;
  
  deltaX2 = 1;
  deltaY2 = 0;
  stroke(0, 0, 0);  //pen black
  rect(5,5,490,490); //border
  dead1=false;  //havent hit anything for player 1
  dead2=false;  //havent hit anything for player 2
}

void draw() 
{
  dead1=detect_collision(x1,y1); //check for collison
  if (!dead1 && !dead2) //if both not dead
  {
    //keep playing 
    stroke(255,0,0);
  point(x1, y1);  //draw a point at current (x1,y1) for player 1
  updatepointplayer1(); //move player 1
  }
  dead2=detect_collision2(x2,y2);
  if (!dead2 && !dead1) // if both not dead 
  {
    //keep playing
    stroke(0,255,0);
    point(x2,y2); // draw a point at current (x2,y2) for player 2
    updatepointplayer2(); //move player 2
  }
  if (dead1 || dead2) //or
  {
    fill(255,0,0); //red
    text("GAME OVER", 230,230); //finish
    fill(0,0,0);
    if (dead1)
    {
      text("Player 2 WINS", 240,250);  //win 2
    }
    else
    text("Player 1 WINS", 240,250);  //win 1
  }
}

boolean detect_collision(int x1, int y1)
{
  color next_pixel=get((int)x1,(int)y1); //get colour of specified position 
  if (next_pixel !=color(255,255,255)) //not background
  return true; //collision detected
  else 
  return false; //no collsion
}

boolean detect_collision2(int x2, int y2)
{
  color next_pixel=get((int)x2,(int)y2); //get colour of specified position 
  if (next_pixel !=color(255,255,255)) //not background
  return true; //collision detected
  else 
  return false; //no collsion
}


void updatepointplayer1() {
  x1 = x1 + speedX1;
  y1 = y1 + speedY1;
}


void updatepointplayer2(){
  x2 = x2 + speedX2;
  y2 = y2 + speedY2;
}
void keyPressed() {
  if (key == CODED)
  {
    if (keyCode == UP && y1>=0) { //restrict to screen edge
      speedX1=0; 
      speedY1=-1;
    } else if (keyCode == DOWN && y1<=500) {
      speedX1=0; 
      speedY1=1;
    } else if (keyCode == LEFT && x1>=0) {
      speedX1=-1; 
      speedY1=0;
    } else if (keyCode == RIGHT && x1<=500) {
      speedX1=1; 
      speedY1=0;
    }
  }
  if(key == 'd' && x2<=500){ //right
        speedX2=1;
        speedY2=0;
      } else if(key == 'a' && x2>=0){ //left
        speedX2=-1;
        speedY2=0;
      } else if (key == 's' && x2>=0){ //down
        speedX2=0;
        speedY2=1;
      } else if( key == 'w' && y2>=0){ //up
        speedX2=0;
        speedY2=-1;
      }
}
