class Wall{
  PVector loc;
  float gap_h;  //The height of the gap
  float gap_loc;  //The starting point of the gap
  float w;  //The height of the wall for easy reference
  Wall(){
    loc = new PVector(random(width/2, width), c.loc.y+c.h   );
    gap_h = random(150,200 );
    gap_loc = random(loc.y, f.loc.y -gap_h-10 );
    w = 50;
  }
  void display(){
    fill(100);
    rect(loc.x ,loc.y, w, gap_loc -loc.y);
    rect(loc.x, gap_loc + gap_h, w,f.loc.y -  gap_loc + gap_h );
  }
  void update(){
    loc.x -= 2;
  }
  
}
