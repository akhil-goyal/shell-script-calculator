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


# ------------------------------- FUNCTIONS --------------------------------------

# Using 'bc' as an arbitrary precision calculator language.
# It can help in dealing with decimal numbers as shell scripting,
# by default, deals with integers only.

function additionFunction(){
    echo "The sum of $firstInput and $secondInput is :"
    expr "$firstInput + $secondInput" | bc -l
}

function subtractionFunction(){
    echo "The difference between $firstInput and $secondInput is :"
    expr "$firstInput - $secondInput" | bc -l
}

function multiplicationFunction(){
    echo "The product of $firstInput and $secondInput is :"
    expr "$firstInput * $secondInput" | bc -l
}

function divisionFunction(){
    echo "The division of $firstInput by $secondInput gives :"
    expr "$firstInput / $secondInput" | bc -l
}

function exitFunction(){
    echo "Sorry to see you go. See you soon!"
    exit 0
}

function errorHandler(){
    echo "$userInput is an invalid input. Please try again!"
}
# --------------------------------------------------------------------------------


# -------------------------- CONDITIONING & LOOPS --------------------------------
while true; do

# User Menu : It will re-display until the user exits.

  echo "Please choose an operation from the list below :"
  echo "1. (A)ddition"
  echo "2. (S)ubtraction"
  echo "3. (M)ultiplication"
  echo "4. (D)ivision"
  echo "5. (E)xit Calculator"

# Capturing the User Input

  read userInput

# Using switch cases to check for user input & invoke the appropriate function.

  case $userInput in
      "A" | "a" | "1" | "ADD" | "add" | "Add")
        echo "Enter the first number : "
        read firstInput
        echo "Enter the second number : "
        read secondInput

        # Calling the function additionFunction & setting firstInput & secondInput as parameters.
        additionFunction $firstInput $secondInput
      ;;

      "S" | "s" | "2" | "SUBTRACT" | "subtract" | "Subtract")
        echo "Enter the first number : "
        read firstInput
        echo "Enter the second number : "
        read secondInput

        # Calling the function subtractionFunction & setting firstInput & secondInput as parameters.
        subtractionFunction $firstInput $secondInput
      ;;

      "M" | "m" | "3" | "MULTIPLY" | "multiply" | "Multiply")
        echo "Enter the first number : "
        read firstInput
        echo "Enter the second number : "
        read secondInput

        # Calling the function multiplicationFunction & setting firstInput & secondInput as parameters.
        multiplicationFunction $firstInput $secondInput
      ;;

      "D" | "d" | "4" | "DIVIDE" | "divide" | "Divide")
        echo "Enter the first number : "
        read firstInput
        echo "Enter the second number : "
        read secondInput

        # Calling the function divisionFunction & setting firstInput & secondInput as parameters.
        divisionFunction $firstInput $secondInput
      ;;

      "E" | "e" | "5" | "EXIT" | "exit" | "Exit")

        # Calling the function exitFunction.
        exitFunction
      ;;

      # Asterisk (*) sign denotes any other value apart from those specified
      # in the cases. 
      *)

        # Calling the function errorHandler & setting userInput as parameter.
        errorHandler $userInput
      ;;
  esac
done
# --------------------------------------------------------------------------------