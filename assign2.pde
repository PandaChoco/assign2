boolean goup,godown,goright,goleft=false;
PImage bg1,bg2,end1,end2,enemy,fighter,hp,enemy1,gainbomb,start1,start2,treasure;
int x,y,mx,my,ex,ey,i =0;
final int Game_start=1,Game_win=2,Game_lose=3,Game_run=4;
int gameState;
float life=0;
int xspeed=5;
int yspeed=5;
int exspeed=5;
float eyspeed=2.5;

void setup () {
  x=width-50;
  y=height/2-25;
  //x=floor(random(590));
  //y=floor(random(440));
  
  life = 195*0.2;
  
  size(640, 480) ;
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  
  mx=floor(random(600));
  my=floor(random(440));
  ex=0;
  ey=floor(random(420));
  
  gameState = Game_start;
}

void draw() {
  
  switch (gameState){
    
    case Game_start:
         image(start2,0,0);
         if (mouseX>200 & mouseX<455 & mouseY>375 & mouseY<415){
             image(start1,0,0);
             if(mousePressed){
                  gameState = Game_run;
              }
         }
         break;
         
     case Game_run:
          image(bg1,i,0);
          image(bg2,i-640,0);
          image(bg1,i-1280,0);
          i++;
          i%=1280;
          
          fill(255,0,0);
          rect(10,0,life,20);
          
          image(hp,0,0);            //life
          
          image(treasure,mx,my);

          image(fighter,x,y);
                  
          image(enemy,ex,ey);
          
          if (goup){
            y-=yspeed;
          }
          if (godown){
            y+=yspeed;
          }
          if (goright){
            x+=xspeed;
          }
          if (goleft){
            x-=xspeed;
          }
          
          if (x<=0){
            x=0;
          }
          if (x>=width-50){
            x=width-50;
          }
          if (y<=0){
            y=0;
          }
          if (y>=height-50){
            y=height-50;
          }
                                    // get treasure
          if ((x>=mx-50)&(x<=mx+40)&(y>=my-50)&(y<my+40)){
            mx=floor(random(600));
            my=floor(random(440));
            life+=19.5;
               if (life >=195){
               life =195;
               }
          }
                                    //  be hit
          if ((x>=ex-50)&(x<=ex+60)&(y>=ey-50)&(y<ey+60)){
             life-=19.5*2;
             ex=0;
             ey=floor(random(420));
          }else {       
                ex+=exspeed;
                ex%=640;
                if((y-ey)>exspeed){
                  ey+=eyspeed;   // speed 
                  }else{
                        if((ey-y)>exspeed){
                        ey-=eyspeed;
                        }
                   }
                }
                
           if (life<=0){
               gameState = Game_lose;
           }
          
          break;
          
     case Game_lose:
          image(end2,0,0);
          if ((mouseX>=208)&(mouseX<=433)&(mouseY>=310)&(mouseY<=345)){
              image(end1,-0.5,0);
              if (mousePressed){
                  gameState=Game_start;
              }
          }else{
            image(end2,0,0);
          }
          life = 195*0.2;
          x=width-50;
          y=height/2-25;
          
          break;
  }
         
}
void keyPressed(){
     if (key==CODED){
         if (keyCode == UP){
            goup=true;
         }else if (keyCode == DOWN){
                  godown=true;
               }
     
          if (keyCode == RIGHT){
             goright=true;
          }else if (keyCode == LEFT){
                    goleft=true;
                 }
     }

}
void keyReleased(){
     if (key==CODED){
         if (keyCode == UP){
            goup=false;
         }else if (keyCode == DOWN){
                  godown=false;
               }
     
        if (keyCode == RIGHT){
           goright=false;
        }else if (keyCode == LEFT){
                  goleft=false;
               }
     }

}
