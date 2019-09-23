PImage background;
int bgX=0; //global variable background location
boolean [] keys = new boolean[128];
ArrayList<bullets> BULLETS = new ArrayList<bullets>();

Defenders redDefender;
final int PLAYING=  0;
final int CRASH=1;
int score = 0;
int gameMode = PLAYING;

bullets BULLET;
Alien GreenAlien1, GreenAlien2, GreenAlien3;


void setup(){
  
 size(800,400);
 background = loadImage("spaceBackground.jpg");
 background.resize(width,height);
 redDefender = new Defenders(50,150);
 GreenAlien1 = new Alien(810,100,1);
 GreenAlien2 = new Alien(810,300,1);
 GreenAlien3 = new Alien(810,200,1);

}

void draw ()
{
  
if (gameMode == PLAYING)
{
  
drawBackground();
text(score, 10, 10);
redDefender.update();
GreenAlien1.update();
GreenAlien2.update();
GreenAlien3.update();

for (bullets BULLET : BULLETS) {
  
  BULLET.render();
  
    if(GreenAlien1.hit()){
      
       GreenAlien1 = new Alien (width,100,1);
       score = score + 10;
       BULLET.remove1(); /*The remove1 move function will remove the bullet, once it comes in contact with the alien  */
   
   
    }
    if(GreenAlien2.hit()){
      
       GreenAlien2 = new Alien(width,300,1);
       score = score + 10;
       BULLET.remove1(); /*The remove1 move function will remove the bullet, once it comes in contact with the alien  */
 
     }
    if(GreenAlien3.hit()){
      
       GreenAlien3 = new Alien(width,200,1);
       score = score + 10;
       BULLET.remove1(); /*The remove1 move function will remove the bullet, once it comes in contact with the alien  */
    }
      
}
  

if (GreenAlien1.move() == false){
   GreenAlien1 = new Alien(810,300,1);
     /*Once Alien1 moves off the screen or is less than the x axis it will resist*/
   
}

else if(GreenAlien2.move() == false){
  GreenAlien2 = new Alien(810,200,1);
     /*Once Alien2 moves off the screen or is less than the x axis it will resist*/
    
}
else if(GreenAlien3.move() == false){
  GreenAlien3 =  new Alien(810,100,1);
     /*Once Alien1 moves off the screen or is less than the x axis it will resist*/
   
}

if(redDefender.crash() == true){
   gameMode = CRASH;
   text("Game Over", 400,50);
   /*If the ship comes in contact with the aliens, the gamemode will end*/
}

}

}

void drawBackground(){
 image(background, bgX, 0); //draw background twice adjacent
 image(background, bgX+background.width, 0);
 bgX -=4;
 if(bgX == -background.width)
 bgX=0; //wrap background

}

void shoot() {
  
  BULLETS.add(new bullets(redDefender.x, redDefender.y,5));
  
}


void keyPressed() {

  keys[keyCode] =true; 
    if(keys['S']){
        shoot();     
    }


}
void keyReleased(){

  keys[keyCode] =false;
}
