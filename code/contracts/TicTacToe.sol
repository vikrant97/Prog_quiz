pragma solidity ^0.4.2;

contract TicTacToe {
  uint32 public gameField = uint32(0);
  address public challenger;
  address public opponent;

  mapping (address => uint ) public depositBalances; 


  uint8 public turnCount = 1;
  address public winner;
  address public currentPlayer;
  uint public timeAtLastTurn = now;

  uint32 ODD = 0x55555;
  uint32 EVEN = 0xAAAAA;

  
}