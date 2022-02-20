# Task 0

Write and explain the `Hello, world!` function.

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
- the number rounded to the second digit after the ".".

Test cases:

        print $ min 5 6 == 5
        print $ minIf 15 60 == 15
        print $ minIf 60 15 == 15
        print $ minGuard 15 60 == 15
        print $ minGuard 60 15 == 15
        print $ minBuiltIn 60 15 == 15

    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32
    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15    

    print $ divReal 154.451 10.01 == 15.42967032967033
    print $ quotientReal 154.21 17.17 == 9

    print $ avgWhole 5 1542 == 773.5

    print $ roundTwoDig 3.1413465345321 == 3.14
    print $ roundTwoDigButWithMagic 3.1413465345321 == 3.14 -- partial function application and composition (defining a function at functional level)

# Task 2

Define a predicate *isInside a b x* that checks whether a number *x* is in an interval [*a*, *b*].

- solve with lists;
- solve using a lambda and boolean expressions.

Test cases:

    print $ isInsideLists 5 1 4 == True
    print $ isInsideLists 10 50 20 == True
    print $ isInsideLists 10 50 1 == False

    print $ isInsideLambda 5 1 4 == True
    print $ isInsideLambda 10 50 20 == True
    print $ isInsideLambda 10 50 1 == False

# Task 3

Define a recursive and an iterative function for calculating the factorial of a non-negative number.

- solve with lists;
- solve with a linearly recursive process;
- solve using a linearly iterative process.

Test cases:

    print $ factXs 11 == 39916800
    print $ factRec 11 == 39916800
    --print $ factRec (-11) -- error: x was negative
    print $ factIter 11 == 39916800
    --print $ factIter (-11) -- error: x was negative

# Task 4

Define a recursive and an iterative function for calculating the number at index *i* in the Fibonacci sequence (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...).

> **Implementation detail**: The input will always be valid, i.e. greater than -1.

Test cases:

    print $ fibRec 11 == 89
    print $ fibIter 11 == 89
    print $ fibIter 110 == 43566776258854844738105

# For home

# Task 1

Define two predicates that return whether a number is even:

- using if-else;
- using guards. <- The preferred way!

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

Define a function for calculating the GCD of two whole numbers.

> **Implementation detail**: Normally, you would use the built-in function `gcd`.

- solve using guards;
- solve using pattern matching; <- The preferred way!

Test cases:

    print $ myGcdG 5 13 == 1
    print $ myGcdG 13 1235 == 13
    
    print $ myGcdPM 5 13 == 1
    print $ myGcdPM 13 1235 == 13

Recap:

    The Euclidean Algorithm for finding GCD(x,y) is as follows:
    If x = 0 then GCD(x,y)=y.
    If y = 0 then GCD(x,y)=x.
    Write x in quotient remainder form (x = A⋅y + R). Find GCD(y,R) (since GCD(x,y)=GCD(y,R)).

# Task 5

Define two predicates that check whether a year is a leap year.

The first should be called *leap-year-one-line?*. It should implement *Method I* using **boolean logical operators**.

The second should be called *is-leap-year-guards?*. It should implement *Method II* using **guards**.

Recap:

    Method I: A year is leap year if it is a multiple of 400 or it is a multiple of 4 but not of 100.

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

John has a backpack. With it he can carry *k* kilograms. An item from the supermarket weighs *w* kilograms.

Define a predicate that accepts three numbers - *c* (number of products), *k* and *w* and returns whether John is capable of buying all the products in one trip to the supermarket.

Implementation detail:

    Use guards.


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
    print $ growingPlant 100 10 910 == 10 -- upSpeed=100, downSpeed=10, desiredHeight=910

Explanations:

- for upSpeed = 100, downSpeed = 10 and desiredHeight = 910, the output should be 10.

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

- for upSpeed = 10, downSpeed = 9 and desiredHeight = 4, the output should be 1.

    Because the plant reaches the desired height at day 1 (10 meters).

    After day 1 --> 10

# Task 8

A snail crawls up a column. During the day it crawls up some distance. During the night it sleeps, so it slides down for some distance (less than it crawls up during the day).

Your function accepts three arguments:

- The height of the column (meters);
- The distance that the snail crawls during the day (meters);
- The distance that the snail slides down during the night (meters).

Calculate the number of days the snail will need to reach the top of the column.

Test cases:

    print $ snail 3 2 1 == 2
    print $ snail 10 3 1 == 5
    print $ snail 10 3 2 == 8
    print $ snail 100 20 5 == 7
    print $ snail 5 10 3 == 1

# Task 9

Define a function that reverses a **non-negative** number by implementing a **linearly iterative process**.

Test cases:

    print $ rev 1 == 1
    print $ rev 123 == 321
    print $ rev 987654321 == 123456789
