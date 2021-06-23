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
    cardImage.resize(100, 153);
    faceDownCardImage.resize(100, 153);
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
  PImage getImage(){
  return cardImage;
  }
  void display(float xCord, float yCord){
    if(!isFaceUp){
 
      image(faceDownCardImage,xCord,yCord);
    }
    else{    
      image(cardImage,xCord,yCord);
    }
}
 }
