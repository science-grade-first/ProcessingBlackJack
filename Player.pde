public class Player{
  private int money;
  private Hand hand;
  private int betAmount;
  
  public Player(){
    this.money= 0;

  }
  public Player(int money){
    this.money = money;
    this.hand = null;
    betAmount = 0;
  }
  public void setHand(Hand hand){
    this.hand = hand;
  }
  public void setBetAmount(int bet){
    betAmount = bet;
  }
  public boolean betAllowed(int bet){
    if (bet>money){
      return false;
    }
    else if (betAmount<0){
      return false;
    }
    else {
      return true;
    }
  }
  public int getBetAmount(){
    return betAmount;
  }
  public void hit(){
    hand.addCard();
  }
  public void doubleDown(){
    if(hand.orginalHand() && (betAllowed(betAmount*2))) {
       betAmount *= 2;
       hand.addCard();
      }
    }
  
  public void winBet(){
    money += betAmount;
  }
  public  void loseBet(){
    money -= betAmount;
  }
  public void winBlackJack(){
    money+= betAmount*1.5;
  }
  public void  printBet(){
  }
  public Hand getHand(){
    return hand;
  }
  public  int getMoney(){
    return money;
  }
  void resolveTurn(Player dealer){
    println("in resolve");
    if (hand.checkBust()){
      println("player busted");
      loseBet();
    }
    else if(dealer.getHand().checkBust()){
      println("dealer busted");
      winBet();
    }
    else if(hand.amountOfCards()==5){
      println("5 cards");
      winBet();
    }
    else if(dealer.getHand().cardTotal()>hand.cardTotal()){
      println("lost bet");
      loseBet();
    }
    else if(dealer.getHand().cardTotal()<hand.cardTotal()){
      println("won  bet");
      winBet();
    }
}

}
