#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate teams, games")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  echo $WINNER vs $OPPONENT
  if [[ $WINNER != 'winner' ]]
  then

    WINNER_ID=$($PSQL "select * from teams where name='$WINNER'")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted winner into teams, $WINNER"
      fi
      WINNER_ID=$($PSQL "select * from teams where name='$WINNER'")
    fi

    OPPONENT_ID=$($PSQL "select * from teams where name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted opponent into teams, $OPPONENT"
      fi
      OPPONENT_ID=$($PSQL "select * from teams where name='$OPPONENT'")
    fi
  fi
done

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $ROUND != 'round' ]]
  then
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    GAME_ID=$($PSQL "select * from games where winner_id=$WINNER_ID and year=$YEAR and round='$ROUND' and opponent_id=$OPPONENT_ID")

    if [[ -z $GAME_ID ]]
    then
      echo "$YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS"
      INSERT_GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted game into games, $YEAR - $ROUND"
      fi
      GAME_ID=$($PSQL "select * from games where winner_id=$WINNER_ID and year=$YEAR and round='$ROUND' and opponent_id=$OPPONENT_ID")
    fi
  fi
done