class Nivel2{
  
  PImage fondonivel2,bescalonesnivel2;
  PersonajeProtagonista pj;
  PersonajeEnemigo [] enemigo=new PersonajeEnemigo[5];
  HUD hud;
  EfectoHojaVolando [] hv=new EfectoHojaVolando[3];
  int fondoX;
  boolean fMovIzq, fMovDer;

  Nivel2(){
    fondonivel2=loadImage("fondonivel2.gif");
    bescalonesnivel2=loadImage("bescalonesnivel2.gif");
    pj=new PersonajeProtagonista(); 
    for(int i=0; i<5; i++){
      enemigo[i]=new PersonajeEnemigo();
    }
    for(int i=0; i<3; i++){
      hv[i]=new EfectoHojaVolando();
    }
    hud=new HUD();
    fondoX=-100;
    fMovIzq=true;
    fMovDer=true;
  }
  
  void ejecutar(){
    dibujar();
    moverfondo();
    hud.ejecutar();
    pasarNivel();
    //sonido();
  }
  
  void presionar(){
    pj.presionar();
  }
  
  void dibujar(){
    background(166);
    image(fondonivel2,fondoX,0);
    hv[0].ejecutar();
    for(int i=0; i<5; i++){
      enemigo[i].ejecutar();
    }
    hv[1].ejecutar();
    pj.ejecutar(0,350);
    image(bescalonesnivel2,0+fondoX,517);
    hv[2].ejecutar();
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
    if(fondoX<-3100){
      fondoX+=3;
      pj.movX+=3;
    }
  }
  
  void pasarNivel(){
    if(pj.posX>=800 && fondoX<=-2800){
      background(0);
      puntos+=saludProtagonista;
      puntos+=energiaProtagonista;
      saludProtagonista+=100;
      energiaProtagonista+=100;
      nivel="Intro Final";
    }
  }
  
}
