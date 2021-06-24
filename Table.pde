class Table{
  PImage table;
  Hand dealerHand, playerHand;
  int recX, recY;
  Button stay, doubleDown,hit, nextHand, plusFiveBet, minusFiveBet;
  TextBox playerMoneyTB, playerBetTB, houseRulesTB, resultTB;
  Deck deck;
  Player player, dealer;
  boolean gameRunning, stayed, busted, displayCards, playerDone, showResults;
  int playerMoney, playerBet;
  String result;
  
  
  Table(){
      result = "";
      table = loadImage("pokertable.jpg");     
      table.resize(1200,800);
      background(table);
      deck = new Deck();
      deck.resetDeck();
      deck.shuffle();
      dealer = new Player(10000);
      player = new Player(100);
      //Player Bet Accounting
      playerMoneyTB = new TextBox(950,300,200,100,"Player's Money: $" +playerMoney, 26);
      playerBetTB = new TextBox(50,300,200,100,"Player's Bet: $" + playerBet, 28);
      houseRulesTB = new TextBox(450,300,250,125,"House  Rules are\n1. BlackJack pays 3/2 \n2. Dealer hits on soft 17 \n3. Five card Charlie", 18);
     //Buttonns
      hit = new Button(375,700,100,50, "HIT");
      stay = new Button(500,700,100,50, "STAY");
      doubleDown = new Button(625,700,100,50, "DD");
      plusFiveBet = new Button(175,410,50,50,"+");
      minusFiveBet = new Button(75,410,50,50,"-");
      nextHand =  new Button(50,500,150,200,"Start Game",45,255,0,0);
      gameRunning  = false;
      stayed = false;
      busted = false;
      displayCards = false;
      playerDone = false;
      deal(player,dealer);
      resultTB = new TextBox(0,0, 300,200,result,35, 255,0,0);
      
  }
  
  
  void display(){
     playerMoney= player.getMoney();
     playerBet = player.getBetAmount();
     playerBetTB.setText("Player's Bet: $" + playerBet);
     playerMoneyTB.setText("Player's Money: $" + playerMoney);
     houseRulesTB.display();
     playerBetTB.display();
     plusFiveBet.display();
     minusFiveBet.display();
     playerMoneyTB.display();    
     nextHand.display();
     hit.display();
     stay.display();
     doubleDown.display();
     
     if (displayCards){
       player.getHand().display(450,500);
       dealer.getHand().display(450,50);
  }
    if (showResults){
      resultTB.display();
      //delay(3000);
    }
  }
  
  boolean getGameStarted(){
   return gameRunning; 
  }
  void runGame(){
      playerTakesTurn();
      
      if (playerDone && !busted){
      dealerTakesTurn(dealer);
      resolveTurn();
      gameRunning = false;
      resetGame();
      }
      else if ((playerDone && busted)){
      
      resolveTurn();
      gameRunning = false;
      resetGame();
      }
  }
  
     void dealerTakesTurn(Player dealer){
        print("in dealer");
        Hand dealerHand = dealer.getHand();
        dealerHand.toggleFirstCard();
        dealerHand.display(450,50);
        while(true){
          dealerHand.display(450,50);
          if(dealerHand.cardTotal()<17){
            dealer.hit();
            dealerHand.display(450,50);
            
          }
          else if(dealerHand.hasAce() && dealerHand.cardTotal() == 17){
            dealer.hit();
            dealerHand.display(450,50);
          }
          else{
            dealerHand.display(450,50);
            break;
          }
        }
 
    }
    
    
    void resetGame(){
      stayed = false;
      busted = false;
      playerDone = false;
      gameRunning = false;
      player.getHand().resetHand();
      dealer.getHand().resetHand();
      displayCards = false;
      deck.shuffle();
      deal(player,dealer);
      player.setBetAmount(0);
    }
    

    public void deal(Player player, Player dealer){
      deck.shuffle();
      Card card1 = deck.getTopCard();
      Card card2 = deck.getTopCard();
      card2.toggleIsFaceUp();
      Card card3 = deck.getTopCard();
      Card card4 = deck.getTopCard();
      Hand hand1 = new Hand(card1,card3,deck);
      Hand hand2 = new Hand(card2,card4,deck);
      player.setHand(hand1);
      dealer.setHand(hand2);
      print("dealer hand dealt");
      dealer.getHand().printHand();
    }
    
    public void setStayed(boolean stayed){
      this.stayed = stayed;
    }
    
    boolean getStayed(){
      return stayed;
    }


void playerTakesTurn(){    
      playerHand = player.getHand();
      playerHand.display(450,500);
      if (!stayed && !busted){
        if (playerHand.blackJack()){
          stayed = true;
        }
        
        if (playerHand.checkBust()){
          //Create TextBox
          busted = true;
          //break;
        }
        
        if(playerHand.amountOfCards()==5){
          stayed = true;
        }
      }
      else{
      print("player done");
      playerDone = true;
      }
    }
    
    void resolveTurn(){
    println("in resolve");
    if (player.getHand().blackJack()){
      resultTB.setText("Previous Hand Result:\n Player BlackJack");
      showResults = true;
      player.winBlackJack();
    }
    else if (dealer.getHand().blackJack()){
      resultTB.setText("Previous Hand Result:\n Dealer BlackJack");
      showResults = true;
      player.loseBet();
    }
    else if (player.getHand().checkBust()){
      resultTB.setText("Previous Hand Result:\nPlayer Busted");
      showResults = true;
      player.loseBet();
    }
    else if (dealer.getHand().checkBust()){
      resultTB.setText("Previous Hand Result:\nDealer Busted");
      showResults = true;
      player.winBet();
    }
    else if(player.getHand().amountOfCards()==5){
      resultTB.setText("Previous Hand Result:\n5 Card Charlie");
      showResults = true;
      player.winBet();
    }
    else if(dealer.getHand().cardTotal()>player.getHand().cardTotal()){
      resultTB.setText("Previous Hand Result:\nDealer Wins");
      showResults = true;
      player.loseBet();
    }
    else if(dealer.getHand().cardTotal()<player.getHand().cardTotal()){
      resultTB.setText("Previous Hand Result:\nPlayer Wins");
      showResults = true;
      player.winBet();
    }
    else{
      resultTB.setText("Previous Hand Result:\nTie");
    }
}
  
 
 void click(){
     
   if (hit.overButton()){
     if(!busted  && gameRunning)
       player.hit();
 }
 else if (stay.overButton()){
   println("stay");
    stayed = true;
 }
 else if (doubleDown.overButton()){
   player.doubleDown();
   if(gameRunning &&  !player.getHand().orginalHand()){
   stayed = true;
   }
 }
 else if (minusFiveBet.overButton()){
   if(playerBet>0 && !gameRunning){
   player.setBetAmount(playerBet -=5);
   }
 }
 else if (plusFiveBet.overButton()){
   if(playerBet< playerMoney && !gameRunning){
   player.setBetAmount(playerBet +=5);
   }
 }
 else if (nextHand.overButton()){
   if (!gameRunning){
     gameRunning = true;
     displayCards = true;
     background(table);
   }
  
 }
  
}
 
  
  
}
