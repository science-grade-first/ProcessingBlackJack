 class Card{
  private String suit;
  private String value;
  private boolean isFaceUp;
  private int numValue;
  PImage cardImage;
  PImage faceDownCardImage;

  public Card(String suit, String value,int numValue, PImage image){
    this.cardImage = image;
    this.suit  = suit;
    this.value = value;
    this.isFaceUp = true;
    this.numValue = numValue;
    faceDownCardImage = loadImage("Red_back.jpg");  
  }
  public String getSuit(){
    return suit;
  }
  public String getValue(){
    return value;
  }
  public void toggleIsFaceUp(){
    isFaceUp = !isFaceUp;
  }
  public void  setNumValue(int newNumValue){
    numValue = newNumValue;
  }
  @Override
  public String toString(){
    if(!isFaceUp){
      return "FACE DOWN";
    }
    else{
      return ("The " +value+ " of " + suit);
    }
  }
  public int getNumValue(){
      return numValue;
  }
  void display(float xCord, float yCord){
    //print("c display ");
    if (isFaceUp){
    cardImage.resize(100, 153);
    image(cardImage,xCord,yCord);
    }
    else{
      faceDownCardImage.resize(100, 153);
    image(faceDownCardImage,xCord,yCord);
    }
  }
}
