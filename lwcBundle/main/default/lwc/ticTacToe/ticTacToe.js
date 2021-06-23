import { LightningElement } from 'lwc';

export default class TicTacToe extends LightningElement {

    game = null;
    player_X = null;
    player_O = null;
    current_turn = null;
    moves = Array(9).fill({});
    scoreboard = false;

    constructor() {
        super();
        for (let [index, move] of this.moves.entries()) {
            move['box'] = index;
            move['letter'] = 'X';
        }
    }

    startGame() {

    }
}