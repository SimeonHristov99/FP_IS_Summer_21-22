# Tasks 1, 2, 3

Resolve test 1 from 2020.

# Task 4

Define a function that accepts a natural number greater than 1 and returns a sorted list of prime factors the product of which gives the number.

Test cases:

    print $ factorize 152 == [2, 2, 2,19]
    print $ factorize 123 == [3, 41]
    print $ factorize 13 == [13]

# Task 5

Define a function that accepts an unary function and a list of natural numbers. The return value should be a function that accepts a predicate and returns the sum of the squares of the numbers which squared pass the predicate.

Test cases:

    print $ (specialSum (5-) [1..10]) (> 0) == 30
    print $ (specialSum (+1) [(-5)..5]) odd == 45
