pragma solidity ^0.4.24;

contract TicTacToe {
    mapping(uint=>uint) board;
	address public challenger;
	address public opponent;


	mapping (address => uint ) public depositBalances; 

	address turn;
	uint8 public turnCount = 1;
	uint8 public winner;
	address public currentPlayer;
	uint public timeAtLastTurn = now;
	uint isopp = 0;

	constructor( ) public {
        challenger=msg.sender;
        currentPlayer=challenger;
        board[0]=0;
        board[1]=0;
        board[2]=0;
        board[3]=0;
        board[4]=0;
        board[5]=0;
        board[6]=0;
        board[7]=0;
        board[8]=0;
  	}

  	function getopponenet() public{
  		require(msg.sender!=challenger,"Challenger cannt be opponent");
  		opponent=msg.sender;
  		isopp =1;
  	}

  	function playerMove (uint8 x, uint8 y) public returns(uint){
  		require(winner==0);
  		require(turnCount<=9);
  		require(3*x+y<=8);
  		require(3*x+y>=0);
  		require(board[3*x+y]==0);
  		require(currentPlayer==msg.sender);
  		require(isopp==1);
  		uint8 value;
  		if(msg.sender==challenger){
	  		board[3*x+y]=1;
	  		value=1;
	  		turnCount++;
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
	  		board[3*x+y]=2;
	  		value=2;
	  		turnCount++;
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
  		return winner;
  	}
}
