pragma solidity ^0.4.2;

contract TicTacToe {
	string board = "000000000";
	uint32 public gameField = uint32(0);
	address public challenger;
	address public opponent;


	mapping (address => uint ) public depositBalances; 

	address turn;
	uint8 public turnCount = 1;
	address public winner;
	address public currentPlayer;
	uint public timeAtLastTurn = now;

	constructor(address _owner) public {
        challenger=msg.sender;
  	}

  	function getopponenet() public{
  		require(msg.sender!=challenger,"Challenger cannt be opponent");
  		opponenet=msg.sender;
  	}

  	function playerMove (uint8 x, uint8 y) public{
  		require(winner==0);
  		require(turncount<=9);
  		require(3*x+y<=8);
  		require(3*x+y>=0);
  		require(board[3*x+y]=="0");
  		
  		if(msg.sender==challenger){
  		board[3*x+y]="x";
  		}
  		if(msg.sender==opponent){
  		board[3*x+y]="O";
  		}
  	}
}