#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

function MENU () {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # display a list of services
  SERVICES=$($PSQL "select * from services")
  echo "$SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done

  # get user input
  read SERVICE_ID_SELECTED

  # search for the service_id
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]
  then
    # return to main menu
    MENU "I could not find that service, what would you like today?"
  else
    # get user number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # search for that number in database
    NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

    if [[ -z $NAME ]]
    then
      echo "I don't have a record for that number. What's your name?"
      read CUSTOMER_NAME

      ENTER_CUSTOMER=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    CUST_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

    echo -e "\nWhat time would you like your "$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')", "$(echo $CUST_NAME | sed -r 's/^ *| *$//g')""
    read SERVICE_TIME

    CUST_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

    APT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUST_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a "$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')" at $SERVICE_TIME, "$(echo $CUST_NAME | sed -r 's/^ *| *$//g').""

  fi

}

MENU