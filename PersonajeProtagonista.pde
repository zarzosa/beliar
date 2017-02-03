class PersonajeProtagonista{
  
  PImage r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  PImage rGolpear01,rGolpear02,rGolpear03,rGolpear04,rGolpear05,rGolpear06,rGolpear07,rGolpear08,rGolpear09,rGolpear10;
  PImage rDisparar01,rDisparar02,rDisparar03,rDisparar04,rDisparar05,rDisparar06,rDisparar07,rDisparar08,rDisparar09,rDisparar10;
  PImage b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12;
  PImage bGolpear01,bGolpear02,bGolpear03,bGolpear04,bGolpear05,bGolpear06,bGolpear07,bGolpear08,bGolpear09,bGolpear10;
  PImage bDisparar01,bDisparar02,bDisparar03,bDisparar04,bDisparar05,bDisparar06,bDisparar07,bDisparar08,bDisparar09,bDisparar10;
  DisparoProtagonista disparo;
  int posX,posY,movX,movY,pjMov,tiempo,tiempoGolpe,tiempoEspecial,estadoGolpe;
  boolean moverDer, moverIzq;
  String estado;
  
  PersonajeProtagonista(){
    r1=loadImage("r01.gif");
    r2=loadImage("r02.gif");
    r3=loadImage("r03.gif");
    r4=loadImage("r04.gif");
    r5=loadImage("r05.gif");
    r6=loadImage("r06.gif");
    r7=loadImage("r07.gif");
    r8=loadImage("r08.gif");
    r9=loadImage("r09.gif");
    r10=loadImage("r10.gif");
    r11=loadImage("r11.gif");
    r12=loadImage("r12.gif");
    rGolpear01=loadImage("rgolpe01.gif");
    rGolpear02=loadImage("rgolpe02.gif");
    rGolpear03=loadImage("rgolpe03.gif");
    rGolpear04=loadImage("rgolpe04.gif");
    rGolpear05=loadImage("rgolpe05.gif");
    rGolpear06=loadImage("rgolpe06.gif");
    rGolpear07=loadImage("rgolpe07.gif");
    rGolpear08=loadImage("rgolpe08.gif");
    rGolpear09=loadImage("rgolpe09.gif");
    rGolpear10=loadImage("rgolpe10.gif");
    rDisparar01=loadImage("rdisparo01.gif");
    rDisparar02=loadImage("rdisparo02.gif");
    rDisparar03=loadImage("rdisparo03.gif");
    rDisparar04=loadImage("rdisparo04.gif");
    rDisparar05=loadImage("rdisparo05.gif");
    rDisparar06=loadImage("rdisparo06.gif");
    rDisparar07=loadImage("rdisparo07.gif");
    rDisparar08=loadImage("rdisparo08.gif");
    rDisparar09=loadImage("rdisparo09.gif");
    rDisparar10=loadImage("rdisparo10.gif");
    b1=loadImage("b01.gif");
    b2=loadImage("b02.gif");
    b3=loadImage("b03.gif");
    b4=loadImage("b04.gif");
    b5=loadImage("b05.gif");
    b6=loadImage("b06.gif");
    b7=loadImage("b07.gif");
    b8=loadImage("b08.gif");
    b9=loadImage("b09.gif");
    b10=loadImage("b10.gif");
    b11=loadImage("b11.gif");
    b12=loadImage("b12.gif");
    bGolpear01=loadImage("bgolpe01.gif");
    bGolpear02=loadImage("bgolpe02.gif");
    bGolpear03=loadImage("bgolpe03.gif");
    bGolpear04=loadImage("bgolpe04.gif");
    bGolpear05=loadImage("bgolpe05.gif");
    bGolpear06=loadImage("bgolpe06.gif");
    bGolpear07=loadImage("bgolpe07.gif");
    bGolpear08=loadImage("bgolpe08.gif");
    bGolpear09=loadImage("bgolpe09.gif");
    bGolpear10=loadImage("bgolpe10.gif");
    bDisparar01=loadImage("bdisparo01.gif");
    bDisparar02=loadImage("bdisparo02.gif");
    bDisparar03=loadImage("bdisparo03.gif");
    bDisparar04=loadImage("bdisparo04.gif");
    bDisparar05=loadImage("bdisparo05.gif");
    bDisparar06=loadImage("bdisparo06.gif");
    bDisparar07=loadImage("bdisparo07.gif");
    bDisparar08=loadImage("bdisparo08.gif");
    bDisparar09=loadImage("bdisparo09.gif");
    bDisparar10=loadImage("bdisparo10.gif");
    disparo=new DisparoProtagonista();
    posX=0;
    posY=0;
    movX=0;
    movY=0;
    pjMov=0;
    tiempo=0;
    tiempoGolpe=0;
    tiempoEspecial=0;
    estadoGolpe=0;
    moverDer=true;
    moverIzq=false;
    estado="caminar";
  }
  
  void ejecutar(int pjX,int pjY){
    disparo.dibujar(posX,posY,moverDer,moverIzq);
    if(saludProtagonista>=0.001){
      dibujar(pjX,pjY);
    }else{
    textFont(fuente1,66);
    textAlign(CENTER);
    fill(166,0,0);
    text("GAME OVER",400,300);
    }
  }
  
  void presionar(){
    if(saludProtagonista>=0.001){
      caminar();
      golpear();
      disparar();
      //especial();
    }else{
      if(keyCode==ENTER || key=='c' || key=='g' || key=='a'){
        nivel="Reiniciar";
      }
    }
  }
  
  void dibujar(int x, int y){
    posX=x+movX;
    posY=y+movY;
    tiempoGolpe--;
    //tiempoEspecial++;
    if(tiempoEspecial>=25){
      estadoGolpe=0;
      tiempoEspecial=0;
    }
    if(saludProtagonista>=100){
      saludProtagonista=100;
    }
    if(energiaProtagonista>=100){
      energiaProtagonista=100;
    }
    if(tiempoGolpe<=0){
      tiempoGolpe=0;
    }
    if(estado=="caminar"){
      if(moverDer){
        if(pjMov>=0 && pjMov<4){
          if(personajeProtagonista=="Remo"){
            image(r1,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b1,posX,posY);
          }
          tiempo=0;
        }else if(pjMov>=4 && pjMov<8){
          if(personajeProtagonista=="Remo"){
            image(r2,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b2,posX,posY);
          }
          tiempo++;
          if(tiempo==175){
            pjMov=8;
            tiempo=0;
          }
        }else if(pjMov>=8 && pjMov<12){
          if(personajeProtagonista=="Remo"){
            image(r3,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b3,posX,posY);
          }
          tiempo=0;
        }else if(pjMov>=12 && pjMov<20){
          if(personajeProtagonista=="Remo"){
            image(r4,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b4,posX,posY);
          }
          tiempo++;
          if(tiempo==175){
            pjMov=20;
            tiempo=0;
          }
        }else if(pjMov>=20 && pjMov<24){
          if(personajeProtagonista=="Remo"){
            image(r5,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b5,posX,posY);
          }
          tiempo=0;
        }else if(pjMov>=24 && pjMov<28){
          if(personajeProtagonista=="Remo"){
            image(r6,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b6,posX,posY);
          }
        }
      }else if(moverIzq){
        if(pjMov>=0 && pjMov<4){
          if(personajeProtagonista=="Remo"){
            image(r7,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b7,posX,posY);
          }
          tiempo=0;
        }else if(pjMov>=4 && pjMov<8){
          if(personajeProtagonista=="Remo"){
            image(r8,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b8,posX,posY);
          }
          tiempo++;
          if(tiempo==175){
            pjMov=8;
            tiempo=0;
          }
        }else if(pjMov>=8 && pjMov<12){
          if(personajeProtagonista=="Remo"){
            image(r9,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b9,posX,posY);
          }
          tiempo=0;
        }else if(pjMov>=12 && pjMov<20){
          if(personajeProtagonista=="Remo"){
            image(r10,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b10,posX,posY);
          }
          tiempo++;
          if(tiempo==175){
            pjMov=20;
            tiempo=0;
          }
        }else if(pjMov>=20 && pjMov<24){
          if(personajeProtagonista=="Remo"){
            image(r11,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b11,posX,posY);
          }
          tiempo=0;
        }else if(pjMov>=24 && pjMov<28){
          if(personajeProtagonista=="Remo"){
            image(r12,posX,posY);
          }else if(personajeProtagonista=="Beliar"){
            image(b12,posX,posY);
          }
        }
      }
    }else if(estado=="golpear" && disparo.flecha==false){
      if(moverDer){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=5){
            image(rGolpear01,posX,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(rGolpear02,posX,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(rGolpear03,posX,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(rGolpear04,posX,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(rGolpear05,posX,posY);
          }
        }else if(personajeProtagonista=="Beliar"){
          if(tiempo>=0 && tiempo<=5){
            image(bGolpear01,posX,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(bGolpear02,posX,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(bGolpear03,posX,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(bGolpear04,posX,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(bGolpear05,posX,posY);
          }
        }
        tiempo++;
        if(tiempo>=25){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }else if(moverIzq){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=5){
            image(rGolpear06,posX-10,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(rGolpear07,posX-10,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(rGolpear08,posX-10,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(rGolpear09,posX-10,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(rGolpear10,posX-10,posY);
          }
        }else if(personajeProtagonista=="Beliar"){
          if(tiempo>=0 && tiempo<=5){
            image(bGolpear06,posX-10,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(bGolpear07,posX-10,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(bGolpear08,posX-10,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(bGolpear09,posX-10,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(bGolpear10,posX-10,posY);
          }
        }
        tiempo++;
        if(tiempo>=25){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }
    }else if(estado=="golpear2" && disparo.flecha==false){
      if(moverDer){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=5){
            image(rGolpear01,posX,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(rGolpear02,posX,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(rGolpear03,posX,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(rGolpear04,posX,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(rGolpear05,posX,posY);
          }
        }else if(personajeProtagonista=="Beliar"){
          if(tiempo>=0 && tiempo<=5){
            image(bGolpear01,posX,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(bGolpear02,posX,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(bGolpear03,posX,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(bGolpear04,posX,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(bGolpear05,posX,posY);
          }
        }
        tiempo++;
        if(tiempo>=25){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }else if(moverIzq){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=5){
            image(rGolpear06,posX-10,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(rGolpear07,posX-10,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(rGolpear08,posX-10,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(rGolpear09,posX-10,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(rGolpear10,posX-10,posY);
          }
        }else if(personajeProtagonista=="Beliar"){
          if(tiempo>=0 && tiempo<=5){
            image(bGolpear06,posX-10,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(bGolpear07,posX-10,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(bGolpear08,posX-10,posY);
          }else if(tiempo>=15 && tiempo<=20){
            image(bGolpear09,posX-10,posY);
          }else if(tiempo>=20 && tiempo<=25){
            image(bGolpear10,posX-10,posY);
          }
        }
        tiempo++;
        if(tiempo>=25){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }
    }else if(estado=="disparar"){
      if(moverDer){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=6){
            image(rDisparar01,posX,posY);
          }else if(tiempo>=6 && tiempo<=12){
            image(rDisparar02,posX,posY);
          }else if(tiempo>=12 && tiempo<=18){
            image(rDisparar03,posX,posY);
          }else if(tiempo>=18 && tiempo<=24){
            image(rDisparar04,posX,posY);
          }else if(tiempo>=24 && tiempo<=32){
            image(rDisparar05,posX,posY);
            disparo.dispararPolar();
          }
        }else if(personajeProtagonista=="Beliar"){
          if(tiempo>=0 && tiempo<=6){
            image(bDisparar01,posX,posY);
          }else if(tiempo>=6 && tiempo<=12){
            image(bDisparar02,posX,posY);
          }else if(tiempo>=12 && tiempo<=18){
            image(bDisparar03,posX,posY);
          }else if(tiempo>=18 && tiempo<=24){
            image(bDisparar04,posX,posY);
          }else if(tiempo>=24 && tiempo<=32){
            image(bDisparar05,posX,posY);
            disparo.dispararPolar();
          }
        }
        tiempo++;
        if(tiempo>=32){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }else if(moverIzq){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=6){
            image(rDisparar06,posX,posY);
          }else if(tiempo>=6 && tiempo<=12){
            image(rDisparar07,posX,posY);
          }else if(tiempo>=12 && tiempo<=18){
            image(rDisparar08,posX,posY);
          }else if(tiempo>=18 && tiempo<=24){
            image(rDisparar09,posX,posY);
          }else if(tiempo>=24 && tiempo<=32){
            image(rDisparar10,posX,posY);
            disparo.dispararPolar();
          }
        }else if(personajeProtagonista=="Beliar"){
          if(tiempo>=0 && tiempo<=6){
            image(bDisparar06,posX,posY);
          }else if(tiempo>=6 && tiempo<=12){
            image(bDisparar07,posX,posY);
          }else if(tiempo>=12 && tiempo<=18){
            image(bDisparar08,posX,posY);
          }else if(tiempo>=18 && tiempo<=24){
            image(bDisparar09,posX,posY);
          }else if(tiempo>=24 && tiempo<=32){
            image(bDisparar10,posX,posY);
            disparo.dispararPolar();
          }
        }
        tiempo++;
        if(tiempo>=32){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }
    }/*else if(estado=="especial" && disparo.flecha==false){
      if(moverDer){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=5){
            image(rEspecial01,posX,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(rEspecial02,posX,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(rEspecial03,posX,posY);
          }
          tiempo+=15;
          if(tiempo>=55){
            estado="caminar";
            pjMov=0;
            tiempo=0;
          }
        }else if(personajeProtagonista=="Beliar"){
          image(b1,posX,posY);
          rect(posX,posY+25,400,15);
        }
        tiempo++;
        if(tiempo>=15){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }else if(moverIzq){
        if(personajeProtagonista=="Remo"){
          if(tiempo>=0 && tiempo<=5){
            image(rEspecial04,posX-510,posY);
          }else if(tiempo>=5 && tiempo<=10){
            image(rEspecial05,posX-510,posY);
          }else if(tiempo>=10 && tiempo<=15){
            image(rEspecial06,posX-510,posY);
          }
          tiempo++;
          if(tiempo>=55){
            estado="caminar";
            pjMov=0;
            tiempo=0;
          }
        }else if(personajeProtagonista=="Beliar"){
          image(b2,posX,posY);
          rect(posX-400,posY+25,400,15);
        }
        tiempo++;
        if(tiempo>=15){
          estado="caminar";
          pjMov=0;
          tiempo=0;
        }
      }
    }*/
  }
  
  void caminar(){
    if(keyCode==RIGHT || key=='8'){
      estado="caminar";
      pjMov++;
      movX+=5;
      moverDer=true;
      moverIzq=false;
    }else if(keyCode==LEFT || key=='2'){
      estado="caminar";
      pjMov++;
      movX-=5;
      moverDer=false;
      moverIzq=true;
    }
    if(pjMov>=28){
      pjMov=0;
    }
  }
  
  void golpear(){
    if((keyCode==DOWN || key=='c') && estado=="caminar"){
      if(tiempoGolpe<=0){
        estado="golpear";
        tiempoGolpe=50;
      }
      estadoGolpe++;
    }
  }
  
  void disparar(){
    if(keyCode==CONTROL || key=='g'){
      if(estado=="caminar"){
        if(moverIzq){
          disparo.angulo=190;
        }else if(moverDer){
          disparo.angulo=-10;
        }
        if(disparo.disparando==false){
          estado="disparar";
          if(energiaProtagonista>=0.001){
            energiaProtagonista-=10;
          }
        }
      }
    }else if(keyCode==SHIFT || key=='a'){
      if(estado=="caminar"){
        if(moverIzq){
          disparo.angulo=250;
        }else if(moverDer){
          disparo.angulo=-75;
        }
        if(disparo.disparando==false){
          estado="disparar";
          if(energiaProtagonista>=0.001){
            energiaProtagonista-=10;
          }
        }
      }
    }
  }
  
}
