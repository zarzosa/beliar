class DisparoEnemigo{
  
  PVector pos,vel,acel,gravedad;
  PImage cruz,biblia,caliz,corazon,cruzdorada;
  float resistencia,enemigoX,enemigoY,posX,angulo;
  boolean disparar, disparando;
  String sentido, enemigo;
  
  DisparoEnemigo(){
    pos=new PVector(-5000,-5000);
    vel=new PVector(0,0);
    acel=new PVector(0,0);
    gravedad=new PVector(0,0.1);
    cruz=loadImage("cruz.gif");
    biblia=loadImage("biblia.gif");
    caliz=loadImage("caliz.gif");
    corazon=loadImage("corazon.gif");
    cruzdorada=loadImage("cruzdorada.gif");
    resistencia=0.005;
    enemigoX=0;
    enemigoY=0;
    posX=0;
    angulo=0;
    disparando=false;
    sentido="izquierda";
  }
  
  void dibujar(float enemigoX_,float enemigoY_,String sentido_,boolean disparar_,String enemigo_){
    sentido=sentido_;
    disparar=disparar_;
    enemigo=enemigo_;
    if(sentido=="derecha"){
      if(enemigo=="Monja" || enemigo=="Padre" || enemigo=="Obispo" || enemigo=="Papa"){
        enemigoX=enemigoX_+80;
        enemigoY=enemigoY_+66;
      }else if(enemigo=="Querubin"){
        enemigoX=enemigoX_+20;
        enemigoY=enemigoY_+66;
      }
    }else if(sentido=="izquierda"){
      if(enemigo=="Monja" || enemigo=="Padre" || enemigo=="Obispo" || enemigo=="Papa"){
        enemigoX=enemigoX_+80;
        enemigoY=enemigoY_+66;
      }else if(enemigo=="Querubin"){
        enemigoX=enemigoX_+20;
        enemigoY=enemigoY_+66;
      }
    }
    if(disparando){
      stroke(255,200,0);
      fill(255,200,0);
      if(nivel=="Nivel 1"){
        posX=pos.x+nivel1.fondoX;
        pushMatrix();
        translate(posX,pos.y);
        rotate(angulo);
        imageMode(CENTER);
        if(enemigo=="Monja"){
          image(cruz,0,0);
        }else if(enemigo=="Padre"){
          image(biblia,0,0);
        }else if(enemigo=="Obispo"){
          image(caliz,0,0);
        }else if(enemigo=="Querubin"){
          image(corazon,0,0);
        }
        imageMode(CORNER);
        popMatrix();
      }else if(nivel=="Nivel 2"){
        posX=pos.x+nivel2.fondoX;
        pushMatrix();
        translate(posX,pos.y);
        rotate(angulo);
        imageMode(CENTER);
        if(enemigo=="Monja"){
          image(cruz,0,0);
        }else if(enemigo=="Padre"){
          image(biblia,0,0);
        }else if(enemigo=="Obispo"){
          image(caliz,0,0);
        }else if(enemigo=="Querubin"){
          image(corazon,0,0);
        }
        imageMode(CORNER);
        popMatrix();
      }else if(nivel=="Nivel 3"){
        posX=pos.x+nivel3.fondoX;
        pushMatrix();
        translate(posX,pos.y);
        rotate(angulo);
        imageMode(CENTER);
        image(cruzdorada,0,0);
        imageMode(CORNER);
        popMatrix();
      }
    }
    angulo+=0.1;
    posicionar();
    mover();
    reubicar();
    dispararPolar();
  }
  
  void posicionar(){
    if(disparando==false){
      if(nivel=="Nivel 1"){
        pos.x=enemigoX-nivel1.fondoX;
      }else if(nivel=="Nivel 2"){
        pos.x=enemigoX-nivel2.fondoX;
      }else if(nivel=="Nivel 3"){
        pos.x=enemigoX-nivel3.fondoX;
      }
      pos.y=enemigoY;
      vel.set(0,0,0);
    }
  }
  
  void dispararPolar(){
    if(disparar){
      if(disparando==false){
        if(sentido=="derecha"){
          if(enemigo=="Monja" || enemigo=="Padre" || enemigo=="Obispo" || enemigo=="Papa"){
            float x = random(6,11)*cos(radians(random(-20,-30)));
            float y = random(6,11)*sin(radians(random(-20,-30)));
            acel.set(x,y,0);
            gravedad.set(0,0.1,0);
            disparando=true;
          }else if(enemigo=="Querubin"){
            float x = 0*cos(radians(random(85,95)));
            float y = 0*sin(radians(random(85,95)));
            acel.set(x,y,0);
            gravedad.set(0,0.1,0);
            disparando=true;
          }
        }else if(sentido=="izquierda"){
          if(enemigo=="Monja" || enemigo=="Padre" || enemigo=="Obispo" || enemigo=="Papa"){
            float x = random(6,11)*cos(radians(random(210,220)));
            float y = random(6,11)*sin(radians(random(210,220)));
            acel.set(x,y,0);
            gravedad.set(0,0.1,0);
            disparando=true;
          }else if(enemigo=="Querubin"){
            float x = 0*cos(radians(random(85,95)));
            float y = 0*sin(radians(random(85,95)));
            acel.set(x,y,0);
            gravedad.set(0,0.1,0);
            disparando=true;
          }
        }
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
       pos.x=enemigoX;
       pos.y=enemigoY;
       vel.set(0,0,0);
       disparando=false;
    }
    if(pos.x==enemigoX && pos.y==enemigoY){
      vel.set(0,0,0);
      gravedad.set(0,0,0);
    }
  }
  
}
