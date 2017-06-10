class Dot{
  float x, y;
  color c;
  float radius;
  Dot(float x, float y, float r){
    this.x=x;
    this.y=y;
    this.radius=r;
  }
  
  void setColor(color c){
    this.c=c;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void setX(float x){
    this.x=x;
  }
  
  void setY(float y){
    this.y=y;
  }
  
  void display(){
    fill(255);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
  
  
  }
  
}