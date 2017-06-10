// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/ERQcYaaZ6F0

class Polyp {
  float x;
  float y;
  float radius, innerRadius;
  color c;
  
  ArrayList<Dot> outerCircleDots=new ArrayList<Dot>();
  ArrayList<Dot> innerCircleDots=new ArrayList<Dot>();
  
  boolean growing = false;
  
  int numPoints= 24; // 24 points of contact, every other outer dot connects fully to inner dot
  
  
  Polyp(float x, float y, float r, float ir, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.radius = r;
    this.innerRadius= ir;
    
    //make outer ring of dots
    float angle=TWO_PI/(float)numPoints;
    stroke(255);
   // translate(width/2,height/2);
  

  
    //make rings of dots
    for(int i=0;i<numPoints;i++){
      outerCircleDots.add(new Dot( radius * sin(angle * i)+x, radius * cos(angle*i)+y, 1));
      innerCircleDots.add(new Dot( innerRadius * sin(angle * i)+x, innerRadius * cos(angle*i)+y, 1));
    }    
    //display();
  }

 // not needed, but it might look cool!
  void grow() {
    if (growing) {
      radius = radius + 0.5;
    }
  }

  boolean edges() {
    return (x + radius > width || x -  radius < 0 || y + radius > height || y - radius < 0);
  }

  void display() {
    
    
    for(Dot d : outerCircleDots){
      d.display();
    }
    for(int x=0;x<innerCircleDots.size();x++){
      if(x%2==0){
        innerCircleDots.get(x).display();
      }
    }
    
    //12 points of contact, 6 full and 6 half
    float x1, x2, y1, y2;
    for(int x = 0; x< outerCircleDots.size();x++){
      if(x%2 ==0){
        //even numbers connect fully
        x1= outerCircleDots.get(x).getX();
        x2= innerCircleDots.get(x).getX();
        
        y1= outerCircleDots.get(x).getY();
        y2= innerCircleDots.get(x).getY();
        stroke(255);
        strokeWeight(1);
        line(x1,y1,x2,y2);
      }else{
        //even numbers connect half
        
        x1= outerCircleDots.get(x).getX();
        x2= innerCircleDots.get(x).getX();
        
        y1= outerCircleDots.get(x).getY();
        y2= innerCircleDots.get(x).getY();
        
        stroke(255);
        strokeWeight(1);
        
        //line(x1,y1,( ((3/4) * x1) + ( (1/4) * x2) ) ,( (3/4) * y1) + ( (1/4) * y2) );      //midpoint equation for 1/4 distance
        //https://math.stackexchange.com/questions/563566/how-do-i-find-the-middle1-2-1-3-1-4-etc-of-a-line
      }
    }
    

  }
  
  float getX(){
    return x;
  }

  float getY(){
    return y;
  }
  float getRadius(){
    return radius;
  }
}