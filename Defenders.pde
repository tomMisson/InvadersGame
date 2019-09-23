class Defenders{
int x,y;
int speedX=2;
int speedY=2;
color test;
color ALIEN1_COLOR = color (0,255,0);
color ALIEN2_COLOR = color(50,100,0);


Defenders(int x, int y){

  this.x = x;
  this.y =y;
  
}
 
 void render(){
 fill(255,0,0);
 rect(x,y,50,20);
 triangle(x+50,y,x+50,y+20,x+60,y+10);
 fill(0,0,100);
 rect(x,y-10,20,10);
}

boolean crash(){

  color detectedColour;
  detectedColour = get(x+75,y);
  if(detectedColour == ALIEN1_COLOR || detectedColour == ALIEN2_COLOR){
    return true;
    }
  return false;
}


void move(){
 
if(keys[UP] && y >0){
  y=y-speedY;
}


if(keys[DOWN] && y < height -20){
    y = y+speedY;
}

  if(keys[LEFT] && x >0){
    x = x-speedX;

}
  if(keys[RIGHT] && x < width){
    x = x+speedX;
}
}
void update() {
crash();
render();
move();

}

}
