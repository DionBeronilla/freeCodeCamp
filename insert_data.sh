#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPP WIN_GOALS OPP_GOALS
do
 if [[ $YEAR != year ]]
 then
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
  if [[ -z $WIN_ID && -z $OPP_ID ]]
  then
    INSERT_BOTH_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER'),('$OPP')")
    WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
  elif [[ -z $WIN_ID ]] 
  then
    INSERT_WIN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  elif [[ -z $OPP_ID ]] 
  then
    INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
  fi

  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WIN_ID,$OPP_ID,$WIN_GOALS,$OPP_GOALS)")
 fi
done