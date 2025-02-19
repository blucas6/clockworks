class Button {
  int diam;
  int posx;
  int posy;
  int col;
  
  Button(int x, int y, int d, int c) {
    posx = x;
    posy = y;
    diam = d; 
    col = c;
  }
  
  void update(int x, int y) {
    if(over(x, y)) {
      fill(150);
    } else {
      fill(col);
    }
    stroke(100);
    ellipse(posx, posy, diam, diam);
  }
  
  boolean over(int x, int y) {
    if(sqrt(sq(x-posx) + sq(y-posy)) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
