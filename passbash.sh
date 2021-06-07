#!/usr/bin/bash

guess_me(){
rand=$RANDOM
correct=${rand:0:1}
	echo Welcome $user_name!! Lets play a simple game! Select a single digit number.
	read -p "Select a one digit number" guessed_number
	while [[ $guessed_number != $correct ]]; do
		read -p "Nope! try again!" guessed_number
	done
	echo "Good Job! You guessed the correct number $correct"
}

check_website_status(){
echo "Do you check your website's service status? Type your domain name only"
url=https://www.
read user_domain
url="${url}$user_domain"
echo $url
stat=0
response=$(curl --write-out '%{http_code}' --silent --output /dev/null $url )
if [[ $response == 200 ]]
then
echo "Server replied with code $response . So Chill!"
else 
echo "Server replied with code $response"
fi
}
quit(){
echo "Goodbye!! SEEYOUAGAIN!"
exit
}

welcome(){
echo Hi there, What is your name?
read user_name
echo "Welcome $user_name!! "

}
menu(){

echo "Select one of the following option:"
	
select os in  "Guessing Game" "Check Website Status" "Get random top ten selected movies from imdb" "Quit" 
do
case $os in
"Guessing Game") 
guess_me
;;
"Check Website Status")
check_website_status
;;
"Get random top ten selected movies from imdb")
python ./imdb_suggestTopMovies.py
;;
"Quit")
quit
;;
*)
echo "Not a correct choice!Please try again"
;;
esac
done
}

welcome
menu
