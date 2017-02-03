class PersonajeEnemigoFinal{
  
  PImage efp1,efp2,efp3,efp4,efp5,efp6,efp7,efp8,efp9,efp10,efp11,efp12;
  DisparoEnemigo disparo;
  int ID,y,movX,emov,tiempo;
  float salud,posX,posY,x,lado,posXMax1,posXMax2,tiempoMax;
  String enemigo,estado,sentido;
  boolean disparar, restarSalud;
  
  PersonajeEnemigoFinal(){
    efp1=loadImage("ep01.gif");
    efp2=loadImage("ep02.gif");
    efp3=loadImage("ep03.gif");
    efp4=loadImage("ep04.gif");
    efp5=loadImage("ep05.gif");
    efp6=loadImage("ep06.gif");
    efp7=loadImage("ep07.gif");
    efp8=loadImage("ep08.gif");
    efp9=loadImage("ep09.gif");
    efp10=loadImage("ep10.gif");
    efp11=loadImage("ep11.gif");
    efp12=loadImage("ep12.gif");
    disparo=new DisparoEnemigo();
    posX=0;
    posY=230;
    x=random(850,1200);
    y=230;
    lado=floor(random(1,2.99));
    posXMax1=random(300,500);
    posXMax2=random(400,800);
    if(nivel=="Nivel 1"){
      ID=floor(random(1,2.99));
    }else if(nivel=="Nivel 2"){
      ID=floor(random(1,4.99));
    }
    movX=0;
    emov=0;
    tiempo=0;
    tiempoMax=random(25,500);
    salud=1500;
    enemigo="Papa";
    estado="vivo";
    sentido="izquierda";
    disparar=false;
    restarSalud=false;
  }
  
  void ejecutar(){
    disparo.dibujar(posX,posY,sentido,disparar,enemigo);
    if(salud>=0.001){
      dibujar();
      mover();
      cambiarSentido();
      detectarColisionDP();
      detectarColisionDE();
      detectarImpactoDP();
      detectarAtaqueEspecialDP();
      detectarDanio();
      disparar();
    }else{
      estado="muerto";
    }
    detectarImpactoDE();
  }
  
  void dibujar(){
    posX=x+movX+nivel3.fondoX;
    posY=y;
    if(sentido=="derecha"){
      if(emov>=0 && emov<=14){
        image(efp1,posX,posY);
      }else if(emov>=14 && emov<=28){
        image(efp2,posX,posY);
      }else if(emov>=28 && emov<=42){
        image(efp3,posX,posY);
      }else if(emov>=42 && emov<=56){
        image(efp4,posX,posY);
      }else if(emov>=56 && emov<=70){
        image(efp5,posX,posY);
      }else if(emov>=70 && emov<=84){
        image(efp6,posX,posY);
      }
      emov++;
      if(emov>=84){
        emov=0;
      }
    }else if(sentido=="izquierda"){
      if(emov>=0 && emov<=14){
        image(efp7,posX,posY);
      }else if(emov>=14 && emov<=28){
        image(efp8,posX,posY);
      }else if(emov>=28 && emov<=42){
        image(efp9,posX,posY);
      }else if(emov>=42 && emov<=56){
        image(efp10,posX,posY);
      }else if(emov>=56 && emov<=70){
        image(efp11,posX,posY);
      }else if(emov>=70 && emov<=84){
        image(efp12,posX,posY);
      }
      emov++;
      if(emov>=84){
        emov=0;
      }
    }
  }
  
  void mover(){
    if(sentido=="izquierda"){
      movX--;
    }else if(sentido=="derecha"){
      movX++;
    }else if(sentido=="reposo"){
      movX=movX;
    }
  }
  
  void cambiarSentido(){
    if(posX<posXMax1 && sentido=="izquierda"){
      sentido="derecha";
      posXMax1=random(0,500);
    }else if(posX>posXMax2 && sentido=="derecha"){
      sentido="izquierda";
      posXMax2=random(100,600);
    }
  }
  
  void detectarColisionDP(){
    if(dist(posX,400,nivel3.pj.posX,400)<=350 && nivel3.pj.estado=="golpear"){
        if(nivel3.pj.moverDer && posX>=nivel3.pj.posX){
          salud-=random(150,250);
          nivel3.pj.estado="golpear2";
        }else if(nivel3.pj.moverIzq && posX<=nivel3.pj.posX){
          salud-=random(150,250);
          nivel3.pj.estado="golpear2";    
        }
    }
  }
  
  void detectarColisionDE(){
    if(dist(posX+138,400,nivel3.pj.posX+150,400)<=136){
      if(sentido=="derecha"){
        saludProtagonista-=random(20,30);
        nivel3.pj.movX-=200;
      }else if(sentido=="izquierda"){
        saludProtagonista-=random(20,30);
        nivel3.pj.movX-=200;
      }
    }
  }
  
  void detectarImpactoDP(){
    if(nivel3.pj.disparo.pos.x>=posX+75 && nivel3.pj.disparo.pos.x<=posX+105 && nivel3.pj.disparo.pos.y>=posY && nivel3.pj.disparo.pos.y<=height-49 && nivel3.pj.disparo.disparando){
      restarSalud=true;
      nivel3.pj.disparo.disparando=false;
    }else{
      restarSalud=false;
    }
  }
  
  void detectarImpactoDE(){
    if(disparo.posX>=nivel3.pj.posX+50 && disparo.posX<=nivel3.pj.posX+100 && disparo.pos.y>=nivel3.pj.posY && disparo.pos.y<=height && disparo.disparando){
      saludProtagonista-=random(10,25);
      disparo.disparando=false;
    }
  }
  
  void detectarAtaqueEspecialDP(){
    if(dist(posX,posY,nivel3.pj.posX,nivel3.pj.posY)<=500 && nivel3.pj.estado=="especial"){
      if(nivel3.pj.moverDer){
        if(posX>=nivel3.pj.posX){
          salud-=random(100,120);
        }
      }else if(nivel3.pj.moverIzq){
        if(posX<=nivel3.pj.posX){
          salud-=random(100,120);  
        }
      }        
    }
  }
  
  void detectarDanio(){
    if(restarSalud){
      salud-=random(100,150);
    }
  }
  
  void disparar(){
    float tdisparo=floor(random(1,66));
    if(posX>10 && posX<width-10){
      if(tdisparo==6){
        disparar=true;
      }else{
        disparar=false;
      }
    }
  }
  
}
