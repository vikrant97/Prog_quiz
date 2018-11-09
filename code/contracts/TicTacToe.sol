pragma solidity ^0.4.22;

contract TicTacToe {
	string public board1 = "000000000";
	bytes32 public board = "000000000";
	uint32 public gameField = uint32(0);
	address public challenger;
	address public opponent;


	mapping (address => uint ) public depositBalances; 

	address turn;
	uint8 public turnCount = 1;
	address public winner;
	address public currentPlayer;
	uint public timeAtLastTurn = now;
	uint isopp = 0;

	constructor(address _owner) public {
        challenger=msg.sender;
        currentPlayer=challenger;
  	}

  	function getopponenet() public{
  		require(msg.sender!=challenger,"Challenger cannt be opponent");
  		opponent=msg.sender;
  		isopp =1;
  	}

  	function playerMove (uint8 x, uint8 y) public{

  		require(winner==0);
  		require(turnCount<=9);
  		require(3*x+y<=8);
  		require(3*x+y>=0);
  		require(board[3*x+y]=="0");
  		require(currentPlayer==msg.sender);
  		require(isopp==1);
  		bytes1 value;
	  	uint8 index=3*x+y;
  		if(msg.sender==challenger){
  			turnCount++;
	  		value="x";
	  		board[index]=value;
	  		if(board[0]==value && board[1]==value && board[2]==value){
	  			winner=1;
	  		}
	  		if(board[3]==value && board[4]==value && board[5]==value){
	  			winner=1;
	  		}
	  		if(board[6]==value && board[7]==value && board[8]==value){
	  			winner=1;
	  		}
	  		if(board[0]==value && board[3]==value && board[6]==value){
	  			winner=1;
	  		}
	  		if(board[1]==value && board[4]==value && board[7]==value){
	  			winner=1;
	  		}
	  		if(board[2]==value && board[5]==value && board[8]==value){
	  			winner=1;
	  		}
	  		if(board[0]==value && board[4]==value && board[8]==value){
	  			winner=1;
	  		}
	  		if(board[2]==value && board[4]==value && board[6]==value){
	  			winner=1;
	  		}
	  		currentPlayer=opponent;
  		}
  		
  		if(msg.sender==opponent){
  			turnCount++;
	  		board[index]="O";
	  		value="O";
	  		if(board[0]==value && board[1]==value && board[2]==value){
	  			winner=2;
	  		}
	  		if(board[3]==value && board[4]==value && board[5]==value){
	  			winner=2;
	  		}
	  		if(board[6]==value && board[7]==value && board[8]==value){
	  			winner=2;
	  		}
	  		if(board[0]==value && board[3]==value && board[6]==value){
	  			winner=2;
	  		}
	  		if(board[1]==value && board[4]==value && board[7]==value){
	  			winner=2;
	  		}
	  		if(board[2]==value && board[5]==value && board[8]==value){
	  			winner=2;
	  		}
	  		if(board[0]==value && board[4]==value && board[8]==value){
	  			winner=2;
	  		}
	  		if(board[2]==value && board[4]==value && board[6]==value){
	  			winner=2;
	  		}
	  		currentPlayer=challenger;
  		}

  	}

}