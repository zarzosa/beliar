class Intro{
  
  PImage intro1,intro2,intro3;
  int pantalla, tiempo;
  boolean activartiempo;

  Intro(){
    intro1=loadImage("intro1.gif");
    intro2=loadImage("intro2.gif");
    intro3=loadImage("intro3.gif");
    pantalla=1;
    tiempo=50;
    activartiempo=true;
  }
  
  void ejecutar(){
    dibujar();
  }
  
  void presionar(){
    activartiempo=true;
    if(tiempo<=0 && keyCode==ENTER){
      pantalla++;
      tiempo=50;
    }
  }
  
  void dibujar(){
    background(26);
    if(activartiempo){
      tiempo--;
    }
    if(tiempo>=50){
      tiempo=50;
      activartiempo=false;
    }
    if(pantalla==1){
      image(intro1,0,0);
      fill(0,166);
      rect(50,475,675,100);
      textMode(CORNER);
      textFont(fuente1,16);
      textAlign(LEFT);
      fill(255);
      text("EL REY DE LAS TINIEBLAS ENCOMIENDA A BELIAR,",60,500);
      text("UNO DE SUS MEJORES DEMONIOS, LA DIFICIL TAREA",60,520);
      text("DE ASESINAR AL PAPA.",60,540);
    }else if(pantalla==2){
      image(intro2,0,0);
      fill(0,166);
      rect(50,475,675,100);
      textMode(CORNER);
      textFont(fuente1,16);
      textAlign(LEFT);
      fill(255);
      text("POR ESTA RAZON LA BESTIA SE APODERA DEL CUERPO",60,500);
      text("DE UN CAMPESINO LLAMADO REMO.",60,520);
    }else if(pantalla==3){
      image(intro3,0,0);
      fill(0,166);
      rect(50,475,675,100);
      textMode(CORNER);
      textFont(fuente1,16);
      textAlign(LEFT);
      fill(255);
      text("PERO DEBIDO A UN IMPREVISTO, ES LLEVADO A UNA",60,500);
      text("IGLESIA DE LA CUAL DEBERA ESCAPAR.",60,520);
    }else{
      nivel="Nivel 1";
    }
  }
  
}
