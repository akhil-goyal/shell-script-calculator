# ---------------------------- WELCOME MESSAGE -----------------------------------

# USER is being used to fetch the system user name.
# (date+"%H") is being used to fetch the current hour.

currentHour=$(date +"%H")

if [ $currentHour -ge 0 -a $currentHour -lt 12 ]
  then
    greetingMessage="Good morning, ${USER}! Welcome to the calculator program."
elif [ $currentHour -ge 12 -a $currentHour -lt 18 ] 
  then
    greetingMessage="Good afternoon, ${USER}! Welcome to the calculator program."
else 
    greetingMessage="Good evening, ${USER}! Welcome to the calculator program."
fi

echo $greetingMessage
# --------------------------------------------------------------------------------