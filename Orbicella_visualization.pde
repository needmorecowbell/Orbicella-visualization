
//Orbicella orb;

//Polyp p,p2; //for testing
//void setup() {
//  size(800, 800);
//  smooth();
//  background(0);
//  translate(width/2,height/2);
//  orb = new Orbicella(2000);
  
//  //p= new Polyp(0, 0, 100, 20, color(0, 255, 0));
// // p.display();
//  //System.out.println("P1 Pos: "+p.getX()+","+ p.getY());
//  //p2= new Polyp(width/4, height/4, 100, 20, color(0, 255, 0));
//  //p2.display();
//  //System.out.println("P2 Pos: "+p2.getX()+","+ p2.getY());

  
//}

//void draw() {
  
//}


// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/QHEQuoIKgNE

ArrayList<Polyp> polyps;

void setup() {
  size(640, 360);
  polyps = new ArrayList<Polyp>();
}

void draw() {
  background(0);


  int total = 10;
  int count = 0;
  int attempts = 0;

  while (count <  total) {
    Polyp newC = newPolyp();
    if (newC != null) {
      polyps.add(newC);
      count++;
    }
    attempts++;
    if (attempts > 1000) {
      noLoop();
      println("FINISHED");
      break;
    } 
  }


  for (Polyp c : polyps) {
    if (c.growing) {
      if (c.edges()) {
        c.growing = false;
      } else {
        for (Polyp other : polyps) {
          if (c != other) {
            float d = dist(c.getX(), c.getY(), other.getX(), other.getY());
            if (d - 2 < c.getRadius() + other.getRadius()) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.display();
    c.grow();
  }
}

Polyp newPolyp() {

  float x = random(width);
  float y = random(height);

  boolean valid = true;
  for (Polyp c : polyps) {
    float d = dist(x, y, c.getX(), c.getY());
    if (d < c.getRadius()) {
      valid = false;
      break;
    }
  }

  if (valid) {
    return new Polyp(x, y,  10, 2, color(0, 255, 0));
  } else {
    return null;
  }
}