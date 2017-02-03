//Beliar v1.1
//Taller Multimedial 1 - Tecnología Multimedial 1
//Año: 2010
//Programación: Emmanuel Zarzosa
//Diseño Gráfico: German Voychisko
//Idea: Maximiliano Romero, Martín Vinci, German Voychisco, Emmanuel Zarzosa
//Presentación Multidia Horror Show 2010: Nicolás Freire, Virginia García, Yanina Lias, Sergio Redigonda, Julia Risso, Maximiliano Romero, Julia Pincheira, Martín Vinci, German Voychisco, Emmanuel Zarzosa
//Creative Commons (Attribution |  Non-Commercial | Share Alike)

import pitaru.sonia_v2_9.*;

Sample sonido1;

Menu menu;
Intro intro;
Nivel1 nivel1;
Nivel2 nivel2;
IntroFinal introfinal;
Nivel3 nivel3;
PFont fuente1;
int puntos;
float saludProtagonista,energiaProtagonista;
String nivel;
String personajeProtagonista;

void setup(){
  Sonia.start(this); 
  sonido1=new Sample("audio1.WAV"); 
  sonido1.play(); 
  
  menu=new Menu();
  intro=new Intro();
  nivel1=new Nivel1();
  nivel2=new Nivel2();
  introfinal=new IntroFinal();
  nivel3=new Nivel3();
  fuente1=loadFont("RetroVilleNC-48.vlw");
  puntos=0;
  saludProtagonista=100;
  energiaProtagonista=100;
  nivel=("Menu");
  personajeProtagonista=("Remo");
  size(800,600);
  smooth();
}

void draw(){
  if (nivel=="Menu"){
    //Menu
    menu.ejecutar();
  }else if(nivel=="Instrucciones"){
    //Instrucciones
    image(menu.fondomenu,0,0);
    if(keyCode==ENTER){
      nivel="Menu";
    }
  }else if(nivel=="Creditos"){
    //Creditos
    image(menu.fondomenu,0,0);
    if(keyCode==ENTER){
      nivel="Menu";
    }
  }else if(nivel=="Intro"){
    //Intro
    intro.ejecutar();
  }else if(nivel=="Nivel 1"){
    //Nivel 1
    nivel1.ejecutar();
  }else if(nivel=="Nivel 2"){
    //Nivel 2
    nivel2.ejecutar();
  }else if(nivel=="Intro Final"){
    //Intro Final
    introfinal.ejecutar();
  }else if(nivel=="Nivel 3"){
    //Nivel 3
    nivel3.ejecutar();
  }
  if(nivel=="Reiniciar"){
    reiniciar();
  }
}

void keyPressed(){
  if (nivel=="Menu"){
    //Menu
    menu.presionar();
  }else if(nivel=="Intro"){
    //Intro
    intro.presionar();
  }else if(nivel=="Nivel 1"){
    //Nivel 1
    nivel1.presionar();
  }else if(nivel=="Nivel 2"){
    //Nivel 2
    nivel2.presionar();
  }else if(nivel=="Intro Final"){
    //Intro Final
    introfinal.presionar();
  }else if(nivel=="Nivel 3"){
    //Nivel 3
    nivel3.presionar();
  }
}

void reiniciar(){
  puntos=0;
  saludProtagonista=100;
  energiaProtagonista=100;
  nivel=("Menu");
  personajeProtagonista=("Remo");
  intro.pantalla=1;
  for(int i=0; i<5; i++){
    nivel1.enemigo[i].reiniciar(false);
    nivel2.enemigo[i].reiniciar(false);
  }
  nivel1.fondoX=0;
  nivel1.pj.posX=0;
  nivel1.pj.posY=0;
  nivel1.pj.movX=0;
  nivel1.pj.movY=0;
  nivel1.pj.pjMov=0;
  nivel1.pj.tiempo=0;
  nivel1.pj.moverDer=true;
  nivel1.pj.moverIzq=false;
  nivel1.pj.estado="caminar";
  for(int i=0; i<5; i++){
    nivel1.enemigo[i].disparo=new DisparoEnemigo();
    nivel1.enemigo[i].posX=0;
    nivel1.enemigo[i].posY=365;
    nivel1.enemigo[i].x=random(850,1200);
    nivel1.enemigo[i].y=365;
    nivel1.enemigo[i].lado=floor(random(1,2.99));
    nivel1.enemigo[i].posXMax1=random(0,500);
    nivel1.enemigo[i].posXMax2=random(300,800);
    nivel1.enemigo[i].ID=0;
    nivel1.enemigo[i].movX=0;
    nivel1.enemigo[i].emov=0;
    nivel1.enemigo[i].tiempo=0;
    nivel1.enemigo[i].tiempoMax=random(200,600);
    nivel1.enemigo[i].enemigo="Padre";
    nivel1.enemigo[i].estado="vivo";
    nivel1.enemigo[i].sentido="izquierda";
    nivel1.enemigo[i].disparar=false;
    nivel1.enemigo[i].restarsalud=false;
    nivel1.enemigo[i].asesinado=false;
  }
  nivel2.fondoX=0;
  nivel2.pj.posX=0;
  nivel2.pj.posY=0;
  nivel2.pj.movX=0;
  nivel2.pj.movY=0;
  nivel2.pj.pjMov=0;
  nivel2.pj.tiempo=0;
  nivel2.pj.moverDer=true;
  nivel2.pj.moverIzq=false;
  nivel2.pj.estado="caminar";
  for(int i=0; i<5; i++){
    nivel2.enemigo[i].disparo=new DisparoEnemigo();
    nivel2.enemigo[i].posX=0;
    nivel2.enemigo[i].posY=365;
    nivel2.enemigo[i].x=random(850,1200);
    nivel2.enemigo[i].y=365;
    nivel2.enemigo[i].lado=floor(random(1,2.99));
    nivel2.enemigo[i].posXMax1=random(0,500);
    nivel2.enemigo[i].posXMax2=random(300,800);
    nivel2.enemigo[i].ID=0;
    nivel2.enemigo[i].movX=0;
    nivel2.enemigo[i].emov=0;
    nivel2.enemigo[i].tiempo=0;
    nivel2.enemigo[i].tiempoMax=random(200,600);
    nivel2.enemigo[i].enemigo="Padre";
    nivel2.enemigo[i].estado="vivo";
    nivel2.enemigo[i].sentido="izquierda";
    nivel2.enemigo[i].disparar=false;
    nivel2.enemigo[i].restarsalud=false;
    nivel2.enemigo[i].asesinado=false;
  }
  introfinal.pantalla=1;
  nivel3.fondoX=0;
  nivel3.pj.posX=0;
  nivel3.pj.posY=0;
  nivel3.pj.movX=0;
  nivel3.pj.movY=0;
  nivel3.pj.pjMov=0;
  nivel3.pj.tiempo=0;
  nivel3.pj.moverDer=true;
  nivel3.pj.moverIzq=false;
  nivel3.pj.estado="caminar";
  nivel3.enemigofinal.posX=0;
  nivel3.enemigofinal.posY=230;
  nivel3.enemigofinal.x=random(850,1200);
  nivel3.enemigofinal.y=230;
  nivel3.enemigofinal.lado=floor(random(1,2.99));
  nivel3.enemigofinal.posXMax1=random(300,500);
  nivel3.enemigofinal.posXMax2=random(400,800);
  nivel3.enemigofinal.ID=0;
  nivel3.enemigofinal.movX=0;
  nivel3.enemigofinal.emov=0;
  nivel3.enemigofinal.tiempo=0;
  nivel3.enemigofinal.tiempoMax=random(25,500);
  nivel3.enemigofinal.salud=1500;
  nivel3.enemigofinal.enemigo="Papa";
  nivel3.enemigofinal.estado="vivo";
  nivel3.enemigofinal.sentido="izquierda";
  nivel3.enemigofinal.disparar=false;
  nivel3.enemigofinal.restarSalud=false;
}

public void stop(){ 
  Sonia.stop(); 
  super.stop(); 
}
