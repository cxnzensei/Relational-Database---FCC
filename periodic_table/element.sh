#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

re='^[0-9]+$'

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ $re ]]
  then
    ATM=$($PSQL "select * from elements inner join properties using(atomic_number) left join types using(type_id) where atomic_number=$1")
    if [[ ! -z $ATM ]]
    then
      echo "$ATM" | while read TYPE_ID BAR ANO BAR SYMBOL BAR NAME BAR AMASS BAR MPC BAR BPC BAR TYPE
      do
        echo "The element with atomic number $ANO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AMASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      done
    else
      echo "I could not find that element in the database."
    fi
  else
    SYM=$($PSQL "select * from elements inner join properties using(atomic_number) left join types using(type_id) where symbol='$1'")
    if [[ ! -z $SYM ]]
    then
      echo "$SYM" | while read TYPE_ID BAR ANO BAR SYMBOL BAR NAME BAR AMASS BAR MPC BAR BPC BAR TYPE
      do
        echo "The element with atomic number $ANO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AMASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      done
    else
      NAM=$($PSQL "select * from elements inner join properties using(atomic_number) left join types using(type_id) where name='$1'")
      if [[ ! -z $NAM ]]
      then
        echo "$NAM" | while read TYPE_ID BAR ANO BAR SYMBOL BAR NAME BAR AMASS BAR MPC BAR BPC BAR TYPE
        do
          echo "The element with atomic number $ANO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AMASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
        done
      else
        echo "I could not find that element in the database."
      fi
    fi
  fi
fi