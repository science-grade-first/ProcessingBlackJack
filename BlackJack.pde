Table table;
boolean started;
void setup() {
     
      size(1200,800);
      table = new Table();

      
 }
 
 void draw(){
     table.display();
     if (table.getGameStarted()){
       table.runGame();
     }
     
 }
 
  void mouseClicked(){
    table.click();
 
 
 } 
