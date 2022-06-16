#!/bin/bash



GREETING() {
echo "Enter your username:"
read USERNAME
# select query to retrieve username from db
# if [[ -z $USERNAME ]]
# welcome message and insert into db
# else 
# welcome back, this is your x time playing
STARTGAME
}

STARTGAME () {
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo my secret number $SECRET_NUMBER
echo "Guess the secret number between 1 and 1000:"

# while number not guessed
# counter varaible
# NUMBER_OF_GUESSES=0
while (( USER_GUESS != SECRET_NUMBER ))
do
  read USER_GUESS
  NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 )) 

  # make sure user input is a number
  if  ! [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  
  else
    # user guess lower than
    if (( USER_GUESS < SECRET_NUMBER ))
    then
      echo "It's higher than that, guess again:"


    # user guess higher than
    elif (( USER_GUESS > SECRET_NUMBER ))
    then
      echo "It's lower than that, guess again:"

    # user guessed the number
    else
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    fi
  fi
  done
}

GREETING
