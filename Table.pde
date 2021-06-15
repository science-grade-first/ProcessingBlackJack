class Table{
  PImage table;
  Hand dealerHand, playerHand;
  int recX, recY;
  Button stay, doubleDown,hit;
  Button nextHand;
  Button plusFiveBet, minusFiveBet;
  TextBox playerMoneyTB, playerBetTB, houseRulesTB;
  Deck deck;
  Player player, dealer;
  boolean gameRunning, stayed, busted, displayCards, playerDone;
  int playerMoney, playerBet;
  
  
  Table(){
  //intilizations
  table = loadImage("pokertable.jpg");
  //intilizations
      
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
  }
  
  
  void display(){
      playerMoney= player.getMoney();
      playerBet = player.getBetAmount();
    //playerBet = player.getBetAmount();
     //dealer.getHand().display(500,600);
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
  }
  boolean getGameStarted(){
   return gameRunning; 
  }
  void runGame(){
      
      playerTakesTurn(player);
      if (playerDone){
      dealerTakesTurn(dealer);
      player.resolveTurn(dealer);
      gameRunning = false;
      resetGame();
      
      }
      //resetGame();
      
  }
  
     void dealerTakesTurn(Player dealer){
      //print("dealerHand");
        Hand dealerHand = dealer.getHand();
        dealerHand.toggleFirstCard();
        
        while(true){
          dealerHand.display(450,50);
          if(dealerHand.cardTotal()<17){
            dealer.hit();
            dealerHand.display(450,50);
          }
          else if(dealerHand.hasAce() && dealerHand.cardTotal() == 17){
            dealer.hit();
            dealerHand.display(450,50);
            //dealerHand.printHand();

          }
          else{
            break;
          }
        }
 
    }
    void resetGame(){
      stayed = false;
      busted = false;
      displayCards = false;
      playerDone = false;
      gameRunning = false;
      print("about to reset hand");
      player.getHand().resetHand();
      dealer.getHand().resetHand();
      deck.shuffle();
      deal(player,dealer);
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
    }
    public void setStayed(boolean stayed){
      this.stayed = stayed;
    }
    boolean getStayed(){
      return stayed;
    }


      void playerTakesTurn(Player player){
      //print("in take turn");
      
      playerHand = player.getHand();
      playerHand.display(450,500);
      //print("in player Turn");
      if (!stayed && !busted){
        if (playerHand.blackJack()){
          stayed = true;
          // Create A textbox
          print("blackjack");
          
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
   }
  
 }
  
}
 
  
  
}
