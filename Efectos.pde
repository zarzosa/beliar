class EfectoHojaVolando{
  
  PImage hoja1;
  PVector pos,acel;
  int tiempo;
  float angulo1,angulo2;
  
  EfectoHojaVolando(){
    hoja1=loadImage("hoja1.gif");
    pos=new PVector(random(-1200,-50),random(25,575));
    acel=new PVector(0,0);
    tiempo=999;
    angulo1=0;
    angulo2=0;
  }
  
  void ejecutar(){
    dibujar();
    moverPolar();
    cambiarAngulo();
    reiniciar();
  }
  
  void dibujar(){
    if(pos.x>=-50){
      imageMode(CENTER);
      pushMatrix();
      translate(pos.x+nivel2.fondoX,pos.y);
      rotate(angulo2);
      image(hoja1,0,0);
      popMatrix();
      imageMode(CORNER);
      angulo2+=0.05;
    }
  }
  
  void moverPolar(){
    acel.set(2*cos(radians(angulo1)),2*sin(radians(angulo1)),0);
    pos.add(acel); 
  }
  
  void cambiarAngulo(){
    if(tiempo>=100){
      angulo1=random(-15,15);
      tiempo=0;
    }else if(tiempo<=100){
      tiempo++;
    }
  }
  
  void reiniciar(){
    if(dist(pos.x+nivel2.fondoX,pos.y,nivel2.pj.posX,nivel2.pj.posY)>=1200){
      pos.set(random(-1200,-50)-nivel2.fondoX,random(25,575),0);
    }
  }
  
}
