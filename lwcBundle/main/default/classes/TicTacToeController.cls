public with sharing class TicTacToeController {

    public class GameObject {
        public Id game;
        public String player_X;
        public String player_O; 
        public Boolean started;
        public List<Move__c> moves;

        public GameObject(Id gameId){
            Game__c currentGame = [SELECT 
                                    Id, 
                                    Current_Turn__c, 
                                    Player_X__r.Name, 
                                    Player_O__r.Name, 
                                    (SELECT Id, Box__c, Letter__c FROM Moves__r) 
                                    FROM Game__c 
                                    WHERE Id = :gameId Limit 1];
            game = gameId;
            player_X = currentGame.Player_X__r.Name;
            player_O = currentGame.Player_O__r.Name;
            moves = currentGame.Moves__r;
            started = true;
        }

        public GameObject(User Player_XUser){
            Game__c newGame = new Game__c(Player_X__c  = Player_XUser.Id);
            insert newGame;

            game = newGame.Id;
            player_X = Player_XUser.Name;

        }
    }




}
