class Alien{
int x,y;
int speedx,speedy;
color ALIEN1 = color(0,255,0);
color ALIEN2 = color(50,100,0);
final color BB = color(255,255,0);

Alien(int x, int y, int speedx){
this.x = x;
this.y= y;
this.speedx = speedx;
}

void render(){

 fill(ALIEN1);
 ellipse(x,y,30,30);
 fill(ALIEN2);
 ellipse(x,y,50,15);
 
}
boolean move(){
x = x - speedx;
float stepY = random(-3,+3);
y = y + (int)stepY;
return (x> 0);
}

boolean hit(){

  color detectedColour;
  for (int i = y-10; i < y+30; i++){
  detectedColour = get(x-30,i);
  if(detectedColour == BB ){
    return true;
    }
  }
  return false;
}



void update(){
render();
move();
hit();
}

}
