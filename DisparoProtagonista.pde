class DisparoProtagonista{
  
  PVector pos,vel,acel,gravedad;
  PImage acido,fuego;
  int angulo;
  float resistencia,pjX,pjY;
  boolean disparando, flecha, disDer, disIzq;
  
  DisparoProtagonista(){
    pos=new PVector(-800,-800);
    vel=new PVector(0,0);
    acel=new PVector(0,0);
    gravedad=new PVector(0,0.1);
    acido=loadImage("acido.gif");
    fuego=loadImage("fuego.gif");
    angulo=-10;
    resistencia=0.005;
    disparando=false;
    flecha=false;
    disDer=true;
    disIzq=false;
  }
  
  void dibujar(int pjX_,int pjY_,boolean disDer_, boolean disIzq_){
    disDer=disDer_;
    disIzq=disIzq_;
    if(personajeProtagonista=="Remo"){
      if(disDer){
        pjX=pjX_+135;
        pjY=pjY_+36;
      }else if(disIzq){
        pjX=pjX_+40;
        pjY=pjY_+36;
      }
    }else if(personajeProtagonista=="Beliar"){
      if(disDer){
        pjX=pjX_+180;
        pjY=pjY_+116;
      }else if(disIzq){
        pjX=pjX_+40;
        pjY=pjY_+116;
      }
    }
    if(disparando){
      stroke(0,200,0);
      fill(0,200,0);
      rectMode(CENTER);
      if(personajeProtagonista=="Remo"){
        image(acido,pos.x,pos.y);
      }else if(personajeProtagonista=="Beliar"){
        image(fuego,pos.x,pos.y);
      }
      rectMode(CORNER);
    }
    posicionar();
    flecha();
    mover();
    reubicar();
  }
  
  void posicionar(){
    if(disparando==false){
      pos.x=pjX;
      pos.y=pjY;
    }
  }
  
  void flecha(){
    if(flecha){
      pushMatrix();
      translate(pjX,pjY);
      rotate(radians(angulo));
      stroke(0,200,0);
      fill(0,200,0);
      rect(0,0,100,1);
      popMatrix();
    }
  }
  
  void dispararPolar(){
    if(disparando==false && energiaProtagonista>=0.001){
      if(disDer){
        float x = 10*cos(radians(angulo)); 
        float y = 10*sin(radians(angulo));
        acel.set(x,y,0);
        gravedad.set(0,0.1,0);
        disparando=true;
        angulo=-10;
        flecha=false;
      }else if(disIzq){
        float x = 10*cos(radians(angulo));
        float y = 10*sin(radians(angulo));
        acel.set(x,y,0);
        gravedad.set(0,0.1,0);
        disparando=true;
        angulo=190;
        flecha=false;
      }
    }
  }
  
  void mover(){
    acel.add(gravedad);
    vel.add(acel);
    pos.add(vel);    
    vel.mult(1-resistencia);    
    acel.set(0,0,0);
    posicionar();
  }
  
  void reubicar(){
    if(pos.y<0 || pos.y>height){
      pos.x=pjX;
      pos.y=pjY;
      vel.set(0,0,0);
      disparando=false;
    }
    if(pos.x==pjX && pos.y==pjY){
      vel.set(0,0,0);
      gravedad.set(0,0,0);
    }
  }
}
