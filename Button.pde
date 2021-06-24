class Button extends TextBox {
  //button is a rectangle with a reaction when pressed
  //Text inside
  Button(float rectX, float rectY, float rectHeight, float rectLength, String buttonText) {
    super(rectX, rectY, rectHeight, rectLength, buttonText);
  }
  Button(float rectX, float rectY, float rectWidth, float rectHeight, String buttonText, int textSize) {
    super(rectX, rectY, rectHeight, rectWidth, buttonText, textSize);
  }
  Button(float rectX, float rectY, float rectWidth, float rectHeight, String buttonText, int textSize, int r, int g, int b) {
    super(rectX, rectY, rectHeight, rectWidth, buttonText, textSize, r, g, b);
  }
  boolean overButton() {
    if (mouseX >= rectX && mouseX <= rectX+rectWidth && mouseY>= rectY && mouseY<= rectY+rectHeight) {
      return true;
    } 
    else {
      return false;
    }
  }
}
