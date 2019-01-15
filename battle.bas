/* Turn based fighting game based on DVM-BASIC  
   by @plrspro
*/

Function Initialize() Uint64
  10  STORE("admin_addr",SIGNER())
  11  PRINTF "Initialize Smart Contarct Data"
  12  RETURN 0 
End Function 

Function CheckContractConfig

/* OWNERSHIP SC MISC FUNCTIONS */

Function TransferOwnership(newowner String) Uint64 
  10  IF ADDRESS_RAW(LOAD("admin_addr")) == ADDRESS_RAW(SIGNER()) THEN GOTO 20 
  11  RETURN 1

  20  STORE("tmpadmin_addr",newowner)
  21  RETURN 0
End Function


Function ClaimOwnership() Uint64 
  10  IF ADDRESS_RAW(LOAD("tmpowner_addr")) == ADDRESS_RAW(SIGNER()) THEN GOTO 20 
  11  RETURN 1

  20  STORE("admin_addr",SIGNER())
  21  RETURN 0
End Function

Function WithdrawRoyalty()

/* MISC (Checks, Prints, Lock) */

//Print Current Status of hosted room
Function PrintGameStatus

//Check And Modify Winner And Loosers
Function ResoluteGameStatus

//
Function checkParticipantValidity

//Check if game exists
Function checkGameExists

/* GAME INTERACTION FUNCTIONS (Participants Only) (HOST, JOIN, TURN) */

// checkGameExists -> checkParticipantValidity -> (HostGame) -> PrintGameStatus
Function HostGame

// checkGameExists -> checkParticipantValidity -> UpdateGameStatus-> (JoinGame) -> PrintGameStatus
Function JoinGame

// checkGameExists -> checkParticipantValidity -> UpdateGameStatus-> (TurnGame) -> PrintGameStatus
Function TurnGame

// checkGameExists -> checkParticipantValidity -> UpdateGameStatus-> (CapitulateGame) -> PrintGameStatus
Function CapitulateGame

/* GAME INTERACTION FUNCTIONS (Public)

//checkGameExists -> UpdateGameStatus -> PrintGameStatus
Function ViewGame

Function ViewLatestHostedGames

Function ViewLatestFinishedGames

Function ViewProfile

Function ViewLeaderboard
