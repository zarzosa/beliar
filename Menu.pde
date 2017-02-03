class Menu{
  
  PImage fondomenu,elementosmenu;
  int item,mX,pX;
  float mMovX,pMovX;
  color color1,color2,color3;
  
  Menu(){
    fondomenu=loadImage("fondomenu.gif");
    elementosmenu=loadImage("elementosmenu.gif");
    item=1;
    mX=-100;
    pX=700;
    mMovX=0;
    pMovX=0;
    color1=color(39);
    color2=color(39);
    color3=color(39);
  }
  
  void ejecutar(){
    dibujar();
    seleccion();
  }
  
  void presionar(){
    seleccionar();
  }
  
  void dibujar(){
    background(fondomenu);
    image(elementosmenu,0,0);
    textFont(fuente1,18);
    textAlign(CENTER);
    fill(color1);
    text("COMENZAR",400,425);
    textSize(13);
    fill(color2);
    text("INSTRUCCIONES",400,473);
    textSize(13);
    fill(color3);
    text("CRÉDITOS",400,525);
  }
  
  void seleccion(){
    if(item==1){
      color1=color(255);
      color2=color(199);
      color3=color(199);
    }else if(item==2){
      color1=color(199);
      color2=color(255);
      color3=color(199);
    }else if(item==3){
      color1=color(199);
      color2=color(199);
      color3=color(255);
    }
  }
  
  void seleccionar(){
    if(keyCode==UP || key=='8'){
      item--;
    }else if(keyCode==DOWN || key=='2'){
      item++;
    }
    if(item<=0){
      item=3;
    }else if(item>=4){
      item=1;
    }
    if(item==1 && (keyCode==ENTER || key=='c' || key=='g' || key=='a')){
      nivel="Intro";
    }else if(item==2 && (keyCode==ENTER || key=='c' || key=='g' || key=='a')){
      nivel="Instrucciones";
    }else if(item==3 && (keyCode==ENTER || key=='c' || key=='g' || key=='a')){
      nivel="Creditos";
    }
  }
  
}
