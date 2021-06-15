class TextBox {
  //button is a rectangle with a reaction when pressed
  //Text inside
  float rectX, rectY; 
  float rectWidth, rectHeight;
  boolean overButton;
  String textBoxText;
  int textSize, red,green,blue;
  TextBox(float rectX, float rectY, float rectWidth,float rectHeight, String textBoxText){
      this.rectX = rectX;
      this.rectY = rectY;
      this.rectHeight = rectHeight;
      this.rectWidth = rectWidth;
      this.textBoxText = textBoxText;
      this.textSize = 35;
      this.red = 255;
      this.green = 255;
      this.blue = 255;
  }
   TextBox(float rectX, float rectY, float rectWidth,float rectHeight, String textBoxText, int textSize){
      this.rectX = rectX;
      this.rectY = rectY;
      this.rectHeight = rectHeight;
      this.rectWidth = rectWidth;
      this.textBoxText = textBoxText;
      this.textSize = textSize;
      this.red = 255;
      this.green = 255;
      this.blue = 255;
   }
   TextBox(float rectX, float rectY, float rectWidth,float rectHeight, String textBoxText,int r, int g,int b){
      this.rectX = rectX;
      this.rectY = rectY;
      this.rectHeight = rectHeight;
      this.rectWidth = rectWidth;
      this.textBoxText = textBoxText;
      this.textSize = 35;
      this.red = r;
      this.green = g;
      this.blue = b;
  }
   TextBox(float rectX, float rectY, float rectWidth,float rectHeight, String textBoxText,int textSize, int r, int g,int b){
      this.rectX = rectX;
      this.rectY = rectY;
      this.rectHeight = rectHeight;
      this.rectWidth = rectWidth;
      this.textBoxText = textBoxText;
      this.textSize = textSize;
      this.red = r;
      this.green = g;
      this.blue = b;
  }
  void display(){
    fill(red,green,blue);
    rect(rectX, rectY,rectWidth, rectHeight);
      overButton = false;
      textSize(textSize);
      fill(0,0,0);
      textAlign(CENTER);
      text(textBoxText, rectX,rectY,rectWidth,rectHeight);
  }
  void setText(String text){
    textBoxText =text;
  }
}
