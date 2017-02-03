class HUD{
  
  PImage vida0,vida1,vida2,vida3,vida4,vida5,vida6,vida7,vida8,vida9,vida10;
  PImage energia0,energia1,energia2,energia3,energia4,energia5,energia6,energia7,energia8,energia9,energia10;
  
  HUD(){
    vida0=loadImage("vida0.gif");
    vida1=loadImage("vida1.gif");
    vida2=loadImage("vida2.gif");
    vida3=loadImage("vida3.gif");
    vida4=loadImage("vida4.gif");
    vida5=loadImage("vida5.gif");
    vida6=loadImage("vida6.gif");
    vida7=loadImage("vida7.gif");
    vida8=loadImage("vida8.gif");
    vida9=loadImage("vida9.gif");
    vida10=loadImage("vida10.gif");
    energia0=loadImage("energia0.gif");
    energia1=loadImage("energia1.gif");
    energia2=loadImage("energia2.gif");
    energia3=loadImage("energia3.gif");
    energia4=loadImage("energia4.gif");
    energia5=loadImage("energia5.gif");
    energia6=loadImage("energia6.gif");
    energia7=loadImage("energia7.gif");
    energia8=loadImage("energia8.gif");
    energia9=loadImage("energia9.gif");
    energia10=loadImage("energia10.gif");
  }
  
  void ejecutar(){
    datosProtagonista();
    if(nivel=="Nivel 3"){
      datosEnemigoFinal();
    }
  }
  
  void datosProtagonista(){
    if(saludProtagonista>=0.001){
      if(saludProtagonista>=0.001 && saludProtagonista<=9.999){
        image(vida1,10,500);
      }else if(saludProtagonista>=9.999 && saludProtagonista<=20.999){
        image(vida2,10,500);
      }else if(saludProtagonista>=20.999 && saludProtagonista<=30.999){
        image(vida3,10,500);
      }else if(saludProtagonista>=30.999 && saludProtagonista<=40.999){
        image(vida4,10,500);
      }else if(saludProtagonista>=40.999 && saludProtagonista<=50.999){
        image(vida5,10,500);
      }else if(saludProtagonista>=50.999 && saludProtagonista<=60.999){
        image(vida6,10,500);
      }else if(saludProtagonista>=60.999 && saludProtagonista<=70.999){
        image(vida7,10,500);
      }else if(saludProtagonista>=70.999 && saludProtagonista<=80.999){
        image(vida8,10,500);
      }else if(saludProtagonista>=80.999 && saludProtagonista<=90.999){
        image(vida9,10,500);
      }else if(saludProtagonista>=90.999 && saludProtagonista<=100){
        image(vida10,10,500);
      }else{
        image(vida0,10,500);
      }
      if(energiaProtagonista>=0.001){
        if(energiaProtagonista>=0.001 && energiaProtagonista<=9.999){
          image(energia1,22,563);
        }else if(energiaProtagonista>=9.999 && energiaProtagonista<=20.999){
          image(energia2,22,563);
        }else if(energiaProtagonista>=20.999 && energiaProtagonista<=30.999){
          image(energia3,22,563);
        }else if(energiaProtagonista>=30.999 && energiaProtagonista<=40.999){
          image(energia4,22,563);
        }else if(energiaProtagonista>=40.999 && energiaProtagonista<=50.999){
          image(energia5,22,563);
        }else if(energiaProtagonista>=50.999 && energiaProtagonista<=60.999){
          image(energia6,22,563);
        }else if(energiaProtagonista>=60.999 && energiaProtagonista<=70.999){
          image(energia7,22,563);
        }else if(energiaProtagonista>=70.999 && energiaProtagonista<=80.999){
          image(energia8,22,563);
        }else if(energiaProtagonista>=80.999 && energiaProtagonista<=90.999){
          image(energia9,22,563);
        }else if(energiaProtagonista>=90.999 && energiaProtagonista<=100){
          image(energia10,22,563);
        }
      }else{
        image(energia0,22,563);
      }
    }
  }
  
  void datosEnemigoFinal(){
    if(saludProtagonista>=0.001 && nivel3.enemigofinal.salud>=0.001){
      fill(66);
      noStroke();
      rect(25,10,750,15);
      fill(166,0,0);
      rect(25,10,nivel3.enemigofinal.salud/2,15);
    }
  }
  
}
