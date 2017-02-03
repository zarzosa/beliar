class Nivel1{
  
  PImage fondonivel1,mbiblianivel1;
  PersonajeProtagonista pj;
  PersonajeEnemigo [] enemigo=new PersonajeEnemigo[5];
  HUD hud;
  int fondoX;
  boolean fMovIzq, fMovDer;

  Nivel1(){
    fondonivel1=loadImage("fondonivel1.gif");
    mbiblianivel1=loadImage("mbiblianivel1.gif");
    pj=new PersonajeProtagonista(); 
    for(int i=0; i<5; i++){
      enemigo[i]=new PersonajeEnemigo();
    }
    hud=new HUD();
    fondoX=-100;
    fMovIzq=true;
    fMovDer=true;
  }
  
  void ejecutar(){
    dibujar();
    moverfondo();
    pasarNivel();
    hud.ejecutar();
    //sonido();
  }
  
  void presionar(){
    pj.presionar();
  }
  
  void dibujar(){
    background(166);
    image(fondonivel1,fondoX,0);
    for(int i=0; i<5; i++){
      enemigo[i].ejecutar();
    }
    pj.ejecutar(100,350);
    image(mbiblianivel1,293+fondoX,452);
  }
  
  void moverfondo(){
    if(fMovIzq){
      if(pj.posX<=225 && !(fondoX>=1)){
        pj.movX+=3;
        fondoX+=3;
      }
    }
    if(fMovDer){
      if(pj.posX>=375){
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
    if(fondoX<-3575){
      fondoX+=3;
      pj.movX+=3;
    }
  }
  
  void pasarNivel(){
    if(pj.posX>=800 && fondoX<=-2800){
      background(0);
      puntos+=saludProtagonista;
      puntos+=energiaProtagonista;
      saludProtagonista+=25;
      energiaProtagonista+=25;
      nivel="Nivel 2";
    }
  }
  
}
