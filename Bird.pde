class Bird{
  PVector loc;
  PVector v;
  PVector acc;
  float r;
  Bird(float x, float y ){
    loc = new PVector(x,y);
    v  = new PVector();
    acc = new PVector();
    r = 15;
  }
  void check_hit(){  //Check if it hit the wall
    //PVector loc = PVector.add(this.loc, v);
    if(loc.x+r > w.loc.x && loc.x+r < w.loc.x+w.w){
      if(loc.y - r > w.loc.y && loc.y -r < w.gap_loc){
        gameOver = true;
      }  
      if(loc.y + r > w.gap_loc + w.gap_h){
        gameOver = true;
      }
    }
  }
  void applyForce(PVector f){
    acc.add(f);
  }
  void checkOnFloor(Floor f){
    PVector loc = PVector.add(this.loc, v);
    if(loc.x > f.loc.x && loc.x  < f.loc.x + f.w && loc.y +r > f.loc.y && loc.y -r < f.loc.y + f.h){
       v.y *= (-1);
    }
   
  }
  void update(){
    v.add(this.acc);
    v.limit(10);
    checkOnFloor(f);
    checkOnFloor(c);
    loc.add(this.v);
    check_hit();
    acc.mult(0);
  }
  void display(){
    fill(255,0,0);
    ellipse(loc.x, loc.y, r*2, r*2);
  }
}
