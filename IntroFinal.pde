class IntroFinal{
  
  PImage intro1,intro2;
  int pantalla, tiempo;
  boolean activartiempo;

  IntroFinal(){
    intro1=loadImage("introfinal1.gif");
    intro2=loadImage("introfinal2.gif");
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
      text("EL PAPA: ¡NO PASARAS DE ESTE PUNTO!",60,500);
      text("BELIAR: NO IMPORTA SI MUERO. YO PERTENEZCO A OTRO",60,520);
      text("MUNDO, REGRESARÉ DE TODAS FORMAS.",60,540);
    }else if(pantalla==2){
      image(intro2,0,0);
      fill(0,166);
      rect(50,475,675,100);
      textMode(CORNER);
      textFont(fuente1,16);
      textAlign(LEFT);
      fill(255);
      text("EL PAPA: ¡PREPARATE PARA COMBATIR!",60,500);
      text("BELIAR: ARRRRGGG!!!.",60,520);
    }else{
      nivel="Nivel 3";
    }
  }
  
}
