class PersonajeEnemigo{
  
  PImage em1,em2,em3,em4,em5,em6,em7,em8,em9,em10,em11,em12;
  PImage ep1,ep2,ep3,ep4,ep5,ep6,ep7,ep8,ep9,ep10,ep11,ep12;
  PImage eo1,eo2,eo3,eo4,eo5,eo6,eo7,eo8,eo9,eo10,eo11,eo12;
  PImage eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8;
  DisparoEnemigo disparo;
  int ID,y,movX,emov,tiempo;
  float salud,posX,posY,x,lado,posXMax1,posXMax2,tiempoMax,darvida;
  String enemigo,estado,sentido;
  boolean disparar, restarsalud,asesinado;
  
  PersonajeEnemigo(){
    em1=loadImage("m01.gif");
    em2=loadImage("m02.gif");
    em3=loadImage("m03.gif");
    em4=loadImage("m04.gif");
    em5=loadImage("m05.gif");
    em6=loadImage("m06.gif");
    em7=loadImage("m07.gif");
    em8=loadImage("m08.gif");
    em9=loadImage("m09.gif");
    em10=loadImage("m10.gif");
    em11=loadImage("m11.gif");
    em12=loadImage("m12.gif");
    ep1=loadImage("p01.gif");
    ep2=loadImage("p02.gif");
    ep3=loadImage("p03.gif");
    ep4=loadImage("p04.gif");
    ep5=loadImage("p05.gif");
    ep6=loadImage("p06.gif");
    ep7=loadImage("p07.gif");
    ep8=loadImage("p08.gif");
    ep9=loadImage("p09.gif");
    ep10=loadImage("p10.gif");
    ep11=loadImage("p11.gif");
    ep12=loadImage("p12.gif");
    eo1=loadImage("o01.gif");
    eo2=loadImage("o02.gif");
    eo3=loadImage("o03.gif");
    eo4=loadImage("o04.gif");
    eo5=loadImage("o05.gif");
    eo6=loadImage("o06.gif");
    eo7=loadImage("o07.gif");
    eo8=loadImage("o08.gif");
    eo9=loadImage("o09.gif");
    eo10=loadImage("o10.gif");
    eo11=loadImage("o11.gif");
    eo12=loadImage("o12.gif");
    eq1=loadImage("q01.gif");
    eq2=loadImage("q02.gif");
    eq3=loadImage("q03.gif");
    eq4=loadImage("q04.gif");
    eq5=loadImage("q05.gif");
    eq6=loadImage("q06.gif");
    eq7=loadImage("q07.gif");
    eq8=loadImage("q08.gif");
    disparo=new DisparoEnemigo();
    posX=0;
    posY=365;
    x=random(850,1200);
    y=365;
    lado=floor(random(1,2.99));
    posXMax1=random(0,500);
    posXMax2=random(100,600);
    if(nivel=="Nivel 1A" || nivel=="Nivel 1"){
      ID=floor(random(1,2.99));
    }else if(nivel=="Nivel 2"){
      ID=floor(random(1,4.99));
    }
    movX=0;
    emov=0;
    tiempo=0;
    tiempoMax=random(300,800);
    if(ID==1){
      salud=random(30,45);
    }else if(ID==2){
      salud=random(45,65);
    }else if(ID==3){
      salud=random(80,90);
    }else if(ID==4){
      salud=random(70,75);
    }
    enemigo="Padre";
    estado="muerto";
    sentido="izquierda";
    disparar=false;
    restarsalud=false;
    asesinado=false;
  }
  
  void ejecutar(){
    if(ID==1 && estado=="vivo"){
      enemigo="Monja";
      y=369;
    }else if(ID==2 && estado=="vivo"){
      enemigo="Padre";
      y=365;
    }else if(ID==3 && estado=="vivo"){
      enemigo="Obispo";
      y=339;
    }else if(ID==4 && estado=="vivo"){
      enemigo="Querubin";
      y=50;
    }
    disparo.dibujar(posX,posY,sentido,disparar,enemigo);
    if(salud>=0.001 && estado=="vivo"){
      dibujar();
      mover();
      cambiarSentido();
      detectarColisionDP();
      detectarColisionDE();
      detectarImpactoDP();
      //detectarAtaqueEspecialDP();
      detectarDanio();
      eliminar();
      disparar();
      mostrarVida();
    }else{
      estado="muerto";
      reiniciar(asesinado);
    }
    detectarImpactoDE();
  }
  
  void dibujar(){
    if(nivel=="Nivel 1"){
      posX=x+movX+nivel1.fondoX;
    }else if(nivel=="Nivel 2"){
      posX=x+movX+nivel2.fondoX;
    }
    posY=y;
    if(enemigo=="Monja"){
      if(sentido=="derecha"){
        if(emov>=0 && emov<=14){
          image(em1,posX,posY);
        }else if(emov>=14 && emov<=28){
          image(em2,posX,posY);
        }else if(emov>=28 && emov<=42){
          image(em3,posX,posY);
        }else if(emov>=42 && emov<=56){
          image(em4,posX,posY);
        }else if(emov>=56 && emov<=70){
          image(em5,posX,posY);
        }else if(emov>=70 && emov<=84){
          image(em6,posX,posY);
        }
        emov++;
        if(emov>=84){
          emov=0;
        }
      }else if(sentido=="izquierda"){
        if(emov>=0 && emov<=14){
          image(em7,posX,posY);
        }else if(emov>=14 && emov<=28){
          image(em8,posX,posY);
        }else if(emov>=28 && emov<=42){
          image(em9,posX,posY);
        }else if(emov>=42 && emov<=56){
          image(em10,posX,posY);
        }else if(emov>=56 && emov<=70){
          image(em11,posX,posY);
        }else if(emov>=70 && emov<=84){
          image(em12,posX,posY);
        }
        emov++;
        if(emov>=84){
          emov=0;
        }
      }
    }else if(enemigo=="Padre"){
      if(sentido=="derecha"){
        if(emov>=0 && emov<=14){
          image(ep1,posX,posY);
        }else if(emov>=14 && emov<=28){
          image(ep2,posX,posY);
        }else if(emov>=28 && emov<=42){
          image(ep3,posX,posY);
        }else if(emov>=42 && emov<=56){
          image(ep4,posX,posY);
        }else if(emov>=56 && emov<=70){
          image(ep5,posX,posY);
        }else if(emov>=70 && emov<=84){
          image(ep6,posX,posY);
        }
        emov++;
        if(emov>=84){
          emov=0;
        }
      }else if(sentido=="izquierda"){
        if(emov>=0 && emov<=14){
          image(ep7,posX,posY);
        }else if(emov>=14 && emov<=28){
          image(ep8,posX,posY);
        }else if(emov>=28 && emov<=42){
          image(ep9,posX,posY);
        }else if(emov>=42 && emov<=56){
          image(ep10,posX,posY);
        }else if(emov>=56 && emov<=70){
          image(ep11,posX,posY);
        }else if(emov>=70 && emov<=84){
          image(ep12,posX,posY);
        }
        emov++;
        if(emov>=84){
          emov=0;
        }
      }
    }else if(enemigo=="Obispo"){
      if(sentido=="derecha"){
        if(emov>=0 && emov<=14){
          image(eo1,posX,posY);
        }else if(emov>=14 && emov<=28){
          image(eo2,posX,posY);
        }else if(emov>=28 && emov<=42){
          image(eo3,posX,posY);
        }else if(emov>=42 && emov<=56){
          image(eo4,posX,posY);
        }else if(emov>=56 && emov<=70){
          image(eo5,posX,posY);
        }else if(emov>=70 && emov<=84){
          image(eo6,posX,posY);
        }
        emov++;
        if(emov>=84){
          emov=0;
        }
      }else if(sentido=="izquierda"){
        if(emov>=0 && emov<=14){
          image(eo7,posX,posY);
        }else if(emov>=14 && emov<=28){
          image(eo8,posX,posY);
        }else if(emov>=28 && emov<=42){
          image(eo9,posX,posY);
        }else if(emov>=42 && emov<=56){
          image(eo10,posX,posY);
        }else if(emov>=56 && emov<=70){
          image(eo11,posX,posY);
        }else if(emov>=70 && emov<=84){
          image(eo12,posX,posY);
        }
        emov++;
        if(emov>=84){
          emov=0;
        }
      }
    }else if(enemigo=="Querubin"){
      if(sentido=="derecha"){
        if(emov>=0 && emov<=6){
          image(eq1,posX,posY);
        }else if(emov>=6 && emov<=12){
          image(eq2,posX,posY);
        }else if(emov>=12 && emov<=18){
          image(eq3,posX,posY);
        }else if(emov>=18 && emov<=24){
          image(eq4,posX,posY);
        }
        emov++;
        if(emov>=24){
          emov=0;
        }
      }else if(sentido=="izquierda"){
        if(emov>=0 && emov<=6){
          image(eq5,posX,posY);
        }else if(emov>=6 && emov<=12){
          image(eq6,posX,posY);
        }else if(emov>=12 && emov<=18){
          image(eq7,posX,posY);
        }else if(emov>=18 && emov<=24){
          image(eq8,posX,posY);
        }
        emov++;
        if(emov>=24){
          emov=0;
        }
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
    if(nivel=="Nivel 1"){
      if(dist(posX,posY,nivel1.pj.posX,nivel1.pj.posY)<=200 && nivel1.pj.estado=="golpear"){
        if(nivel1.pj.moverDer && posX>=nivel1.pj.posX){
          salud-=random(90,100);
          saludProtagonista+=5;
          energiaProtagonista+=10;
          if(enemigo=="Monja"){
            puntos+=15;
          }else if(enemigo=="Padre"){
            puntos+=25;
          }else if(enemigo=="Obispo"){
            puntos+=35;
          }
          asesinado=true;
          nivel1.pj.estado="golpear2";
        }else if(nivel1.pj.moverIzq && posX<=nivel1.pj.posX){
          salud-=random(90,100);
          saludProtagonista+=5;
          energiaProtagonista+=10;
          if(enemigo=="Monja"){
            puntos+=15;
          }else if(enemigo=="Padre"){
            puntos+=25;
          }else if(enemigo=="Obispo"){
            puntos+=35;
          }
          asesinado=true;
          nivel1.pj.estado="golpear2";   
        }
      }
    }else if(nivel=="Nivel 2"){
      if(dist(posX,posY,nivel2.pj.posX,nivel2.pj.posY)<=200 && nivel2.pj.estado=="golpear"){
        if(nivel2.pj.moverDer && posX>=nivel2.pj.posX){
          salud-=random(90,100);
          saludProtagonista+=5;
          energiaProtagonista+=10;
          if(enemigo=="Monja"){
            puntos+=15;
          }else if(enemigo=="Padre"){
            puntos+=25;
          }else if(enemigo=="Obispo"){
            puntos+=35;
          }
          asesinado=true;
          nivel2.pj.estado="golpear2";
        }else if(nivel2.pj.moverIzq && posX<=nivel2.pj.posX){
          salud-=random(90,100);
          saludProtagonista+=5;
          energiaProtagonista+=10;
          if(enemigo=="Monja"){
            puntos+=15;
          }else if(enemigo=="Padre"){
            puntos+=25;
          }else if(enemigo=="Obispo"){
            puntos+=35;
          }
          asesinado=true;
          nivel2.pj.estado="golpear2";  
        }
      }
    }
  }

  void detectarColisionDE(){
    if(nivel=="Nivel 1"){
      if(dist(posX,posY,nivel1.pj.posX,nivel1.pj.posY)<=25){
        if(enemigo=="Monja"){
          saludProtagonista-=random(10,15);
        }else if(enemigo=="Padre"){
          saludProtagonista-=random(20,30);
        }else if(enemigo=="Obispo"){
          saludProtagonista-=random(30,35);
        }else if(enemigo=="Querubin"){
          saludProtagonista-=random(5,15);
        }
        if(sentido=="derecha"){
          nivel1.pj.movX+=150;
        }else if(sentido=="izquierda"){
          nivel1.pj.movX-=150;
        }
      }
    }else if(nivel=="Nivel 2"){
      if(dist(posX,posY,nivel2.pj.posX,nivel2.pj.posY)<=25){
        if(enemigo=="Monja"){
          saludProtagonista-=random(10,15);
        }else if(enemigo=="Padre"){
          saludProtagonista-=random(20,30);
        }else if(enemigo=="Obispo"){
          saludProtagonista-=random(30,35);
        }else if(enemigo=="Querubin"){
          saludProtagonista-=random(5,15);
        }
        if(sentido=="derecha"){
          nivel2.pj.movX+=150;
        }else if(sentido=="izquierda"){
          nivel2.pj.movX-=150;
        }
      }
    }
  }
  
  void detectarImpactoDP(){
    if(nivel=="Nivel 1"){
      if(nivel1.pj.disparo.pos.x>=posX+75 && nivel1.pj.disparo.pos.x<=posX+105 && nivel1.pj.disparo.pos.y>=posY && nivel1.pj.disparo.pos.y<=height-49 && nivel1.pj.disparo.disparando){
        restarsalud=true;
        asesinado=true;
        if(enemigo=="Monja"){
          puntos+=5;
        }else if(enemigo=="Padre"){
          puntos+=10;
        }else if(enemigo=="Obispo"){
          puntos+=20;
        }
        nivel1.pj.disparo.disparando=false;
      }else{
        restarsalud=false;
      }
    }else if(nivel=="Nivel 2"){
      if(enemigo=="Monja" || enemigo=="Padre" || enemigo=="Obispo"){
        if(nivel2.pj.disparo.pos.x>=posX+75 && nivel2.pj.disparo.pos.x<=posX+105 && nivel2.pj.disparo.pos.y>=posY && nivel2.pj.disparo.pos.y<=height-49 && nivel2.pj.disparo.disparando){
          restarsalud=true;
          asesinado=true;
          if(enemigo=="Monja"){
          puntos+=5;
        }else if(enemigo=="Padre"){
          puntos+=10;
        }else if(enemigo=="Obispo"){
          puntos+=20;
        }
          nivel2.pj.disparo.disparando=false;
        }else{
          restarsalud=false;
        }
      }else if(enemigo=="Querubin"){
        if(nivel2.pj.disparo.pos.x>=posX+75 && nivel2.pj.disparo.pos.x<=posX+105 && nivel2.pj.disparo.pos.y>=posY && nivel2.pj.disparo.pos.y<=posY+67 && nivel2.pj.disparo.disparando){
          restarsalud=true;
          asesinado=true;
          puntos+=50;
          nivel2.pj.disparo.disparando=false;
        }else{
          restarsalud=false;
        }
      }
    }
  }
  
  void detectarImpactoDE(){
    if(nivel=="Nivel 1"){
      if(disparo.posX>=nivel1.pj.posX+50 && disparo.posX<=nivel1.pj.posX+100 && disparo.pos.y>=nivel1.pj.posY && disparo.pos.y<=height && disparo.disparando){
        if(enemigo=="Monja"){
          saludProtagonista-=random(3,8);
        }else if(enemigo=="Padre"){
          saludProtagonista-=random(5,12);
        }else if(enemigo=="Obispo"){
          saludProtagonista-=random(15,20);
        }else if(enemigo=="Querubin"){
          saludProtagonista-=random(20,25);
        }
        disparo.disparando=false;
      }
    }else if(nivel=="Nivel 2"){
      if(disparo.posX>=nivel2.pj.posX+50 && disparo.posX<=nivel2.pj.posX+100 && disparo.pos.y>=nivel2.pj.posY && disparo.pos.y<=height && disparo.disparando){
        if(enemigo=="Monja"){
          saludProtagonista-=random(3,8);
        }else if(enemigo=="Padre"){
          saludProtagonista-=random(5,12);
        }else if(enemigo=="Obispo"){
          saludProtagonista-=random(15,20);
        }else if(enemigo=="Querubin"){
          saludProtagonista-=random(20,25);
        }
        disparo.disparando=false;
      }
    }
  }
  
  void detectarDanio(){
    if(restarsalud){
      salud-=random(45,55);
    }
  }
  
  void eliminar(){
    if(nivel=="Nivel 1"){
      if(dist(posX,posY,nivel1.pj.posX,nivel1.pj.posY)>1200){
        salud=0;
      }
    }else if(nivel=="Nivel 2"){
      if(dist(posX,posY,nivel2.pj.posX,nivel2.pj.posY)>1200){
        salud=0;
      }
    }
  }
  
  void disparar(){
    float tdisparo=floor(random(1,256));
    if(tdisparo==6){
      disparar=true;
    }else{
      disparar=false;
    }
  }
  
  void mostrarVida(){
    fill(66);
    noStroke();
    rect(posX+25,posY-15,100/2,7);
    fill(166,0,0);
    rect(posX+25,posY-15,salud/2,7);
  }
  
  void reiniciar(boolean asesinado_){
    if(estado=="muerto"){
      tiempo++;
      if(tiempo>=tiempoMax){
        posXMax1=random(0,500);
        posXMax2=random(100,600);
        if(nivel=="Nivel 1A" || nivel=="Nivel 1"){
          ID=floor(random(1,2.99));
        }else if(nivel=="Nivel 2"){
          ID=floor(random(1,4.99));
        }
        movX=0;
        tiempo=0;
        darvida=floor(random(1,10.99));
        tiempoMax=random(200,600);
        if(ID==1){
          salud=random(30,45);
        }else if(ID==2){
          salud=random(45,65);
        }else if(ID==3){
          salud=random(80,90);
        }else if(ID==4){
          salud=random(70,75);
        }
        restarsalud=false;
        lado=(floor(random(1,2.99)));
        if(nivel=="Nivel 1"){
          if(nivel1.fondoX>=-200){
            x=random(850,950)-nivel1.fondoX;
          }else if(lado==1){
            x=random(-150,-100)-nivel1.fondoX;
            sentido="derecha";
          }else if(lado==2){
            x=random(850,950)-nivel1.fondoX;
            sentido="izquierda";
          }
        }else if(nivel=="Nivel 2"){
          if(nivel2.fondoX>=-200){
            x=random(850,950)-nivel2.fondoX;
          }else if(lado==1){
            x=random(-150,-100)-nivel2.fondoX;
            sentido="derecha";
          }else if(lado==2){
            x=random(850,950)-nivel2.fondoX;
            sentido="izquierda";
          }
        }
        if((darvida==6 || darvida==9) && asesinado && saludProtagonista>=0.001){
          saludProtagonista+=random(10,26);
          energiaProtagonista+=random(10,26);
          asesinado=false;
        }
        estado="vivo";
      }
    }
  }
  
}
