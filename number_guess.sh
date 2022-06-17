#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


GREETING() {
echo "Enter your username:"
read USERNAME

# select query to retrieve username from db
echo $($PSQL "SELECT username, user_id, game_id, best_game, games_played FROM user_table FULL JOIN game_records USING(user_id) WHERE username = '$USERNAME'") | while IFS="|" read Q_USERNAME Q_USER_ID  Q_GAME_ID Q_BEST_GAME Q_GAMES_PLAYED
do
  # DEBUG checking variable values stored correctly
  # echo "$Q_USERNAME $Q_USER_ID $Q_GAME_ID $Q_BEST_GAME $Q_GAMES_PLAYED"
if [[ -z $Q_USERNAME ]]
then 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # inserts
  ADD_USER_RESULT=$($PSQL "INSERT INTO user_table(username) VALUES('$USERNAME')")

else
  echo "Welcome back, $Q_USERNAME! You have played $Q_GAMES_PLAYED games, and your best game took $Q_BEST_GAME guesses."

fi
  # $Q_USERNAME $Q_USER_ID $Q_GAME_ID $Q_BEST_GAME $Q_GAMES_PLAYED only exist in the scope of this while loop
done

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
