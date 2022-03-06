# Task 1

Define a predicate that checks whether a non-negative number is a palindrome.

Hint:

    A number is a palindrome if and only if it is the same number from right to left as well as from left to right.

Test cases:

    print $ isPalindrome 1 == True
    print $ isPalindrome 6 == True
    print $ isPalindrome 1010 == False
    print $ isPalindrome 505 == True
    print $ isPalindrome 123321 == True
    print $ isPalindrome 654 == False
    print $ isPalindrome 121 == True
    print $ isPalindrome 12 == False
    print $ isPalindrome 120 == False
    print $ isPalindrome 12321 == True
    print $ isPalindrome 1221 == True

# Task 2

Define a recursive function for calculating the sum of the digits of a whole number.

Test cases:

    print $ sumDigitsRec 12345 == 15
    print $ sumDigitsRec 123 == 6

# Task 3

Define a recursive and an iterative function for calculating *x* to the power of *n*, where *x* is real and *n* is positive.

Test cases:

    print $ powRec 2 5 == 32
    print $ powRec 15 3 == 3375

    print $ powIter 2 5 == 32
    print $ powIter 15 3 == 3375
    
    --print $ powRec 2 0 == 1 -- should return an error (according to the task description)

# Task 4

Define a predicate that checks whether a number is prime.

Hint:

    A number - n, is prime if and only if it is natural and its only divisors are 1 and n.

Test cases:

    print $ isPrime 1 == False
    print $ isPrime 2 == True
    print $ isPrime 3 == True
    print $ isPrime 6 == False
    print $ isPrime 61 == True

# Task 5

Define a function that returns the sum of the divisors of a non-negative number.

Test cases:

    print $ sumDivs 0 == 0
    print $ sumDivs 1 == 1
    print $ sumDivs 6 == 12 -- 1 + 2 + 3 + 6
    print $ sumDivs 12345 == 19776

# Task 6

Define a predicate that checks whether a number is perfect.

Test cases:

    print $ isPerfect 1 == False -- the sum of the divisors is 0, because of the hint
    print $ isPerfect 6 == True -- 1 + 2 + 3 = 6 = 6
    print $ isPerfect 495 == False
    print $ isPerfect 33550336 == True

Hint:

    A number is perfect if and only if it is natural and equal to the sum of its divisors that are less than n.

# Task 7

Define a predicate that checks whether the digits of a non-negative whole number are ordered in an ascending order.

Test cases:

    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False

# For home

# Task 1

Define a recursive and an iterative function for calculating the number of digits of a non-negative number.

Implementation detail:

    Use guards!

Test cases:

    --print $ countDigitsIter (-13) -- error "n was negative"
    print $ countDigitsIter 12345 == 5
    print $ countDigitsIter 123 == 3

    --print $ countDigitsRec (-13) -- error "n was negative"
    print $ countDigitsRec 12345 == 5
    print $ countDigitsRec 123 == 3

# Task 2

Define **an iterative** function for calculating the sum of the digits of a non-negative number.

Test cases:

    -- print $ sumDigitsIter (-13) -- error "n was negative"
    print $ sumDigitsIter 12345 == 15
    print $ sumDigitsIter 123 == 6

# Task 3

Define a function that returns the sum of all prime divisors of a given number.

Test cases:

    print $ sumPrimeDivs 0 == 0
    print $ sumPrimeDivs 6 == 5 -- 2 + 3
    print $ sumPrimeDivs 18 == 5 -- 2 + 3
    print $ sumPrimeDivs 19 == 19
    print $ sumPrimeDivs 45136 == 53

# Task 4

Define a function that returns the number of occurrences of a given digit in a given positive number.

Test cases:

    print $ countOccurences 121 1 == 2

# Task 5

Define a predicate that checks whether two numbers are amicable.

Test cases:

    print $ areAmicable 200 300 == False
    print $ areAmicable 220 284 == True
    print $ areAmicable 284 220 == True
    print $ areAmicable 1184 1210 == True
    print $ areAmicable 2620 2924 == True
    print $ areAmicable 6232 6368 == True

Hint:

    Two numbers are amicable if the sum of the divisors of one of them is equal to the other.

# Task 6

A number is interesting if and only if it is evenly divided by the sum of its digits. Define a predicate that checks whether a number is interesting.

Test case:

    print $ isInteresting 410 == True
    print $ isInteresting 212 == False
    print $ isInteresting 567 == False
    print $ isInteresting 70 == True 
    print $ isInteresting 5 == True 
    print $ isInteresting 4 == True 

# Task 7

Given a divisor *d* and a bound *b*, find the largest integer *N*, such that:

    *N* is divisible by *d*
    and *N* is less than or equal to *b*
    and *N* is greater than 0.

Test cases:

    print $ maxMultiple 2 7 == 6
    print $ maxMultiple 3 10 == 9
    print $ maxMultiple 7 17 == 14
    print $ maxMultiple 10 50 == 50
    print $ maxMultiple 37 200 == 185
    print $ maxMultiple 7 100 == 98  
    print $ maxMultiple 7 10 == 7
    print $ maxMultiple 4 4 == 4

# Task 8

Write a function that removes the digit d from the number n.

Test cases:

    print $ removeD 1 656 == 656
    print $ removeD 5 656 == 66
    print $ removeD 6 656 == 5
    print $ removeD 0 606 == 66
    print $ removeD 0 600 == 6
    print $ removeD 6 600 == 0
    print $ removeD 2 1234 == 134

# Task 9

Write a function that forms a number from every other digit starting from the right of an integer n (n >= 10).

Test cases:

    print $ everyOther 12 == 1
    print $ everyOther 852369 == 628
    print $ everyOther 1714 == 11
    print $ everyOther 12345 == 42
    print $ everyOther 891 == 9
    print $ everyOther 123 == 2
    print $ everyOther 2121 == 22
    print $ everyOther 4736778 == 767
    print $ everyOther 448575 == 784
    print $ everyOther 4214 == 14

# Task 10

Define a function that takes two numbers and returns the number of palindromes between them.

Test cases:

    print $ countPalindromes 5 13 == 5 -- 6 7 8 9 11
    print $ countPalindromes 13 5 == 5 -- 6 7 8 9 11

# Task 11

Define a predicate that accepts a number and returns if and only if the number is prime **and** every number that is produced by removing digits from right to left is prime.

Test cases:

    print $ truncatablePrime 3797 == True -- 3797, 379, 37 and 3 are all prime
    print $ truncatablePrime 47 == False -- 47 is prime, but 4 is not

# Task 12

Write a function that accepts three whole numbers - *a*, *b* and *n* and returns the **sum** of the **last three** numbers from the following sequence.

![Alt text](assets/task14.png?raw=true "task14.png")

Note:

    n will always be > 3.

Test cases:

    print $ findSum 0 2 10 == 3578 -- 510 + 1022 + 2046
    print $ findSum 5 3 5 == 174 -- 26 + 50 + 98

Explanations:

In the first example a = 0, b = 2, n = 10. The resulting sequence is therefore s0, s1, s2, ...

- s0 = 0 + 1 * 2 = 2
- s1 = 0 + 1 *2 + 2* 2 = 6
- s2 = 0 + 1 *2 + 2* 2   + 4 * 2 = 14
 and so on.

In the second example a = 5, b = 3, n = 5. The resulting sequence is therefore s0, s1, s2, ...

- s0 = 5 + 1 * 3 = 8
- s1 = 5 + 1 *3 + 2* 3 = 14
- s2 = 5 + 1 *3 + 2* 3 + 4 * 3 = 26
 and so on.
