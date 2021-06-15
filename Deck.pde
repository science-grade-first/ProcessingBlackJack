import java.util.ArrayList;
import java.util.Collections;
PImage cardImage;
 class Deck{
  private ArrayList<Card> deck;
  Deck(){
    resetDeck();
  }
  public void resetDeck(){
    String suits[] = new String[] { "Clubs","Spades","Hearts","Diamonds"};
    String values[] = new String[] { "Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"};
    this.deck = new ArrayList<Card>();
    String suit;
    String value;
    int numValue;
    String cardSuitIndicator;
    String cardValueIndicator;
    for (int i=0; i<4;i++){
        for(int j=0; j<13;j++){
          suit = suits[i];
          value = values[j];
          cardSuitIndicator =  suit.substring(0,1);
          if (j==0){
            //Ace =11 unless set to 1
            numValue = 11;
            cardValueIndicator =  value.substring(0,1);
          }
          else if (j>9){
            numValue = 10;
            cardValueIndicator =  value.substring(0,1);
          }
          else{
            numValue = j+1;
            cardValueIndicator = "" +numValue;
          }
          cardImage =loadImage(cardValueIndicator+cardSuitIndicator+".jpg");
          Card card = new Card(suit,value,numValue,cardImage);
          deck.add(card);

        }
    }
  }
  public void shuffle(){
    Collections.shuffle(deck);
  }
  public Card getTopCard(){
    Card topCard = deck.get(0);
    deck.remove(0);
    return topCard;
  }
  public void printDeck(){
    for (int i=0; i<deck.size();i++){
      System.out.println(deck.get(i));
    }
  }

}
