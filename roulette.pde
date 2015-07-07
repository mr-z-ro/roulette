class Walker {

  int x;
  int y;
  int lastx;
  int lasty;
  int bet;
  int maxloss;
  int maxwin;
  int oldmaxloss;
  int steps;
  int maxes;
  
  Walker() {
    x = width/2;
    y = height/2;
    lastx = x;
    lasty = y;
    bet = 1;
    maxloss = 0;
    oldmaxloss = 0;
    maxwin = 0;
    steps = 0;
    maxes = 0;
  }
  
  void display() {
    stroke(0);
    line(lastx,lasty,x,y);
    if (maxloss > oldmaxloss) {
      fill(0,0,0);
      textSize(12);
      text(steps, 3*width/4-40, maxes * 12);
      text(maxloss, 3*width/4, maxes * 12);
      text(maxwin, 3*width/4+40, maxes * 12);
      maxes++;
    }
  }

  void step() {

    int choice = int(random(100));
    lastx = x;
    lasty = y;
    
    /* Bet On Red */
    if (choice >= 0 && choice <= 48) {
      /* Win */
      x = x + 2;
      y = y - bet;
      bet = 1;
    } else if (choice > 48 && choice < 98) {
      /* Loss - black */
      x = x - 2;
      y = y + bet;
      bet = bet * 2;
    } else if (choice == 98 || choice == 99) {
      /* Loss - green */
      y = y + bet;
      bet = bet * 2;
    }
    
    oldmaxloss = maxloss;
    maxloss = max(maxloss, y-height/2);
    maxwin = max(maxwin, height/2-y);
    steps++;
  }
}

Walker w;

void setup() {
  size(640,360);

  w = new Walker();
  background(255);
}



void draw() {

  w.step();
  w.display();

}


