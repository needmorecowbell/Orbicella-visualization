

class Orbicella {
  int numPolyps;
  ArrayList<Polyp> polyps= new ArrayList<Polyp>();
  int maxOuterRadius= 10;
  int minOuterRadius= 5;
  int radius;
  float outInRatio = 1/5;
  

  Orbicella(int numPolyps) {
    this.numPolyps= numPolyps;
    
  
  

  
    //make rings of polyps
    for(int i=0;i<numPolyps;i++){
      radius= (int)(Math.random()*maxOuterRadius)+minOuterRadius;
      polyps.add(new Polyp( (float)(Math.random()*width)+maxOuterRadius, (float)(Math.random()*height)+maxOuterRadius, radius, radius*outInRatio, color(0, 255, 0)));
      
    }    
    display();
  }
  
  void display(){
    for(Polyp p: polyps){
      p.display();
    }
  }





 
}