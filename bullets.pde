class bullets{
final color BB = color(255,255,0);
color ALIEN1_COLOR = color (0,255,0);
color ALIEN2_COLOR = color(50,100,0);
int x,y;
int speedx;

bullets(int x, int y, int speedx){
  
this.x = x;
this.y = y;
this.speedx= speedx;
}

void render(){
  
fill(255,255,0);
ellipse(x,y,20,10);
move();
}

void move(){
x = x + speedx;
}

void remove1(){
  x = -5;
  y = -5;
}

 
  
}
