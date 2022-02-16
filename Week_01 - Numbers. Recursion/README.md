# Task 1
Define functions that return:
 - the smaller of two whole numbers:
     - add a test with negative numbers;
     - using if-else;
     - using guards;
     - using a built-in function.
 - the last digit of a number.
 - the quotient of the division of two whole numbers.
 - the quotient and remainder of the division of two whole numbers.
 - a whole number without its last digit.
 - the quotient and remainder of the division of two real numbers.
 - the quotient of the division of two real numbers.
 - the average of two whole numbers.

    Test cases:

        print $ min 5 6 == 5
        print $ minIf (-60) (-15) == (-60)
        print $ minIf 15 60 == 15
        print $ minIf 60 15 == 15
        print $ minGuard 15 60 == 15
        print $ minGuard 60 15 == 15
        print $ minBuiltIn 60 15 == 15

        print $ lastDigit 154 == 4

        print $ quotientWhole 64 2 == 32
        print $ divWhole 154 17 == 9.058823529411764

        print $ removeLastDigit 154 == 15    

        print $ divReal 154 10 == 15.4
        print $ quotientReal 154.21 17.17 == 9

        print $ averageWhole 5 1542 == 773.5

# Task 2
Define a predicates that check:
 - whether two numbers are not equal:
    - **in one line without** using if-else;
    - using guards.

 - whether a whole number *x* is between two whole numbers - *a* and *b* **in one line without** using if-else.

    Test cases:

        print $ areNotEqualOneLine 5 2 == True
        print $ areNotEqualOneLine 5 5 == False
        print $ areNotEqualGuards 5 2 == True
        print $ areNotEqualGuards 5 5 == False
        
        print $ inside 1 5 4 == True -- a = 1, b = 5, x = 4
        print $ inside 5 1 4 == True
        print $ inside 10 50 20 == True
        print $ inside 10 50 1 == False

# Task 3
Define a recursive and an iterative function for calculating the factorial of a non-negative whole number:
 - add a test case with a negative number;
 - using pattern matching;
 - using guards.

Test cases:

    print $ factPM 11 == 39916800
    print $ factGuards 11 == 39916800
    print $ factIter 11 == 39916800

# Task 4
Define a recursive function for calculating the number at index *i* in the Fibonacci sequence (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...).
 - add a test case with a negative number.

Test cases:

    print $ fib 11 == 89

# For home
# Task 1
Define two predicates that return whether a number is even:

 - using if-else;
 - using guards.
    
    Test cases:
        
        print $ isEvenIf 2 == "Yes"
        print $ isEvenIf 15452 == "Yes"
        print $ isEvenIf 321 == "No"
        print $ isEvenGuards 2 == "Yes"
        print $ isEvenGuards 15452 == "Yes"
        print $ isEvenGuards 321 == "No"

# Task 2
Define two functions that return the sum of the cubes of two **whole** numbers:

 - using a power operator;
 - **without** using a power operator.

    Test cases:

        print $ sumCubesPow 5 1 == 126
        print $ sumCubesPow 10 50 == 126000
    
        print $ sumCubesNoPow 5 1 == 126
        print $ sumCubesNoPow 10 50 == 126000

# Task 3
Define a function that returns the average of the sum of the squares of two **whole** numbers.

Test cases:

    print $ sqAvg 5 0 == 12.5
    print $ sqAvg 10 13 == 134.5

# Task 4
Define a function for calculating the GCD of two **whole** numbers. **Use guards!**

Recap:

    The Euclidean Algorithm for finding GCD(x,y) is as follows:
    If x = 0 then GCD(x,y)=y.
    If y = 0 then GCD(x,y)=x.
    Write x in quotient remainder form (x = A⋅y + R). Find GCD(y,R) (since GCD(x,y)=GCD(y,R)).

Test cases:

    print $ myGcd 5 13 == 1
    print $ myGcd 13 1235 == 13

# Task 5
Define two predicates that check whether a year is a leap year.

The first should be called *isLeapYearOneLine*. It should implement *Method I* using **boolean logical operators**.

The second should be called *isLeapYearGuards*. It should implement *Method II* using **guards**.

Recap:

    Method I:
        A year is leap year if the following conditions are satisfied:
            Year is multiple of 400.
            Year is multiple of 4 and not multiple of 100.

    Method II:
        if year is divisible by 400 then is_leap_year
        else if year is divisible by 100 then not_leap_year
        else if year is divisible by 4 then is_leap_year
        else not_leap_year 

Test cases:

    print $ isLeapYearOneLine 2020 == True
    print $ isLeapYearOneLine 1988 == True
    print $ isLeapYearOneLine 1600 == True
    print $ isLeapYearOneLine 2400 == True
    print $ isLeapYearOneLine 2023 == False
    print $ isLeapYearOneLine 1700 == False
    print $ isLeapYearOneLine 1800 == False
    print $ isLeapYearOneLine 2100 == False
    
    print $ isLeapYearGuards 2020 == True
    print $ isLeapYearGuards 1988 == True
    print $ isLeapYearGuards 1600 == True
    print $ isLeapYearGuards 2400 == True
    print $ isLeapYearGuards 2023 == False
    print $ isLeapYearGuards 1700 == False
    print $ isLeapYearGuards 1800 == False
    print $ isLeapYearGuards 2100 == False

# Task 6
John has a backpack. With it he can carry *k* kilograms. An item from the supermarket weighs *w* kilograms. Define a function that accepts three numbers - *c* (number of products), *k* and *w* and returns whether John is capable of buying all the products in one trip to the supermarket.

Implementation detail:

    Use guards!

Test cases:

    print $ canCarry 5 15 3 == "Yes"
    print $ canCarry 1 5 4 == "Yes"
    print $ canCarry 13 25 2 == "No"
    print $ canCarry 24 104.44 21.12 == "No"
    print $ canCarry 51 34.75 19.852 == "No"
    print $ canCarry 42 95.11 0.51 == "Yes"
    --print $ canCarry (-13) 25 2 -- error: The number of products was negative
    --print $ canCarry 13 (-25) 2 -- error: John's hosting capacity was negative
    --print $ canCarry 13 25 (-2) -- error: The weight of a product was negative

# Task 7
Each **day** a plant is growing by *upSpeed* meters. Each **night** that plants height decreases by *downSpeed* meters due to the lack of sun light. Initially, plant is 0 meters tall. We plant the seed at the beginning of a day. We want to know when the height of the plant will reach a certain level.

Test cases:

    print $ growingPlant 5 2 5 == 1
    print $ growingPlant 5 2 6 == 2
    print $ growingPlant 10 9 4 == 1
    print $ growingPlant 100 10 910 == 10

Explanations:

For upSpeed = 100, downSpeed = 10 and desiredHeight = 910, the output should be 10.

    After day 1   --> 100
    After night 1 --> 90
    After day 2   --> 190
    After night 2 --> 180
    After day 3   --> 280
    After night 3 --> 270
    After day 4   --> 370
    After night 4 --> 360
    After day 5   --> 460
    After night 5 --> 450
    After day 6   --> 550
    After night 6 --> 540
    After day 7   --> 640
    After night 7 --> 630
    After day 8   --> 730
    After night 8 --> 720
    After day 9   --> 820
    After night 9 --> 810
    After day 10  --> 910 

For upSpeed = 10, downSpeed = 9 and desiredHeight = 4, the output should be 1.

    Because the plant reaches the desired height at day 1 (10 meters).

    After day 1 --> 10

# Task 8
A snail crawls up a column. During the day it crawls up some distance. During the night it sleeps, so it slides down for some distance (less than it crawls up during the day).

Your function accepts three arguments:
 - The height of the column (meters);
 - The distance that the snail crawls during the day (meters);
 - The distance that the snail slides down during the night (meters).

Calculate number of days the snail will need to reach the top of the column.

Test cases:

    print $ snail 3 2 1 == 2
    print $ snail 10 3 1 == 5
    print $ snail 10 3 2 == 8
    print $ snail 100 20 5 == 7
    print $ snail 5 10 3 == 1

# Task 9
Define a function that reverses a <strong>non-negative</strong> number by implementing a linearly iterative process.

Test cases:

    print $ rev 1 == 1
    print $ rev 123 == 321
    print $ rev 987654321 == 123456789
