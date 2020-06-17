Bird b;
Floor f;
Floor c;  //Ceiling
float vertiSpeed = 10;
int score =0;
boolean gameOver = false;
Wall w;
void setup(){
   fullScreen();
   b = new Bird( width/4, height - 100 );
   f = new Floor( 0, height-50 );
  c = new Floor(0,0);
  w = new Wall();
  noStroke();
  textAlign(CENTER);
}
void display_world(){

  w.display();
  f.display();
  c.display();
  b.display();
}
void destroy_wall(){  //and create a new one
   if(w.loc.x +w.w+ 30< b.loc.x-b.r){
       w = new Wall();
       score++;
   }
}
void update_world(){
  w.update();
  b.applyForce(new PVector(0,0.35) );  
  b.update();
  destroy_wall();
}
void draw(){
  background(255);
  if(!gameOver){
    update_world();
    display_world();
  }else{
    display_world();
    textSize(90);
    text("GAME OVER!" , width/2 , height/2);
    if(keyPressed && key == ' '){
      score =0;
      gameOver = false;
      setup();
    }
  }
  
  textSize(30);
  text("Score: " + score, 50,20);
}
void keyPressed(){ 
  if(b.v.y >0 ){
    b.v.y = -10;
  }
}
