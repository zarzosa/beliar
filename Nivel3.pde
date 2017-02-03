class Nivel3{
  
  PImage fondonivel3;
  PersonajeProtagonista pj;
  PersonajeEnemigoFinal enemigofinal;
  HUD hud;
  int fondoX;
  boolean fMovIzq, fMovDer;

  Nivel3(){
    fondonivel3=loadImage("fondonivel3.gif");
    pj=new PersonajeProtagonista(); 
    enemigofinal=new PersonajeEnemigoFinal();
    hud=new HUD();
    fondoX=-100;
    fMovIzq=true;
    fMovDer=true;
    saludProtagonista=100;
    energiaProtagonista=100;
  }
  
  void ejecutar(){
    dibujar();
    moverfondo();
    victoria();
    hud.ejecutar();
  }
  
  void presionar(){
    pj.presionar();
  }
  
  void dibujar(){
    personajeProtagonista=("Beliar");
    background(166);
    image(fondonivel3,fondoX,0);
    enemigofinal.ejecutar();
    pj.ejecutar(100,261);
  }
  
  void moverfondo(){
    if(fMovIzq){
      if(pj.posX<=225 && !(fondoX>=1)){
        pj.movX+=3;
        fondoX+=3;
      }
    }
    if(fMovDer){
      if(pj.posX>=375 && fondoX>=-1112){
        pj.movX-=3;
        fondoX-=3;
      }
    }
    if(fondoX>=-1 && pj.posX<50){
      fMovIzq=false;
      pj.movX+=5;
      fondoX-=5;
    }else if(fondoX<900){
      fMovIzq=true;
    }
    if(fondoX<-800 && pj.posX>625){
      fMovDer=false;
      pj.movX-=5;
    }else{
      fMovDer=true;
    }
  }
  
  void victoria(){
    if(enemigofinal.estado=="muerto"){
      textFont(fuente1,66);
      textAlign(CENTER);
      fill(166,0,0);
      text("¡HAS GANADO!",400,300);
      if(keyCode==ENTER || key=='c' || key=='g' || key=='a'){
        nivel="Reiniciar";
      }
    }
  }
  
}
