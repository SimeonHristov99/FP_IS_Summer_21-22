# Task 0

Solve the sample theory test (Theory.pdf).

# Task 1

A number is interesting if and only if it is evenly divided by the sum of its digits. Define a predicate that checks whether a number is interesting.

Test case:

    print $ isInteresting 410 == True
    print $ isInteresting 212 == False
    print $ isInteresting 567 == False
    print $ isInteresting 70 == True 
    print $ isInteresting 5 == True 
    print $ isInteresting 4 == True 

# Task 2

Define a function that returns the sum of the special numbers in the interval [x, y] (x <= y). A number is special if it contains 6 and can be expressed as 4k + 1, where k is a whole number.

> **Implementation detail**: Solve the task with one line of code.

Test case:

    print $ specialSum 1 100 == 195 -- 61, 65, 69

# Task 3

Write a function that, for a list *xss* whose elements are non-empty lists of numbers, returns a list of those elements of *xss* that represent an arithmetic progression.

Test case:

    print $ onlyArithmentic [[3], [1, 2, 3, 4, 5], [3, 5, 8, 9, 11]]  == [[3], [1, 2, 3, 4, 5]]

# Task 4

Define the function sine, that accepts a whole number and a real number (representing radians) and returns the n-th partial sum of sin(x).

Reference the formula for writing sin(x) around the origin:

![Alt text](assets/sin.png?raw=true "sin")

Test cases:

    print $ mySin 100 1 == 0.8414709848078965 -- n = 100, x = 1
    print $ mySin 100 0.5 == 0.479425538604203

# Task 5

Define a function that accepts two unary functions "f" and "g" and a list of values and checks whether f dominates g. We say that one function dominates another if for every value the absolute value after applying "f" is greater than or equal to the absolute value after applying "g".

> **Implementation detail**: Solve the task with one line of code using folding.

Test cases:

    print $ dominates (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominates (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True

# Task 6

By using the following types define a function that accepts a list of records and returns the hardest subject.

Test case:

    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 2), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 2)] == "English"
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 5), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 5)] == "Maths"

# Task 7

Define a function that takes a whole number and returns its ascending left suffix. The ascending left suffix of a number is the number that forms a strictly ascending sequence, if read from right to left.

Test cases:

    print $ reverseOrdSuff 37563 == 36
    print $ reverseOrdSuff 32763 == 367
    print $ reverseOrdSuff 32567 == 7
    print $ reverseOrdSuff 32666 == 6

# Task 8

Write a function that sums the unique numbers in the sublists of a list.

Test cases:

    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] == 45

# Task 9

A product is represented as an ordered pair (name, price).

    type Product = (String, Double)

Availability in a given shop is presented with a list of products.

    type StoreAvailability = [Product]

Sample database:

    db1 = [(”bread”,1),(”milk”,2.5),(”lamb”,10),(”cheese”,5),(”butter”,2.3)]
    db2 = [(”bread”,1),(”cheese”,2.5),(”bread”,1),(”cheese”,5),(”butter”,2.3)]

Your tasks:

1. Define a function that returns the name of the product whose price is closest to the average price for all products in a database. If there is more than one such product, return the name of any of the found.

2. Define a function that returns the number of products for which a product with the same name but a lower price exists.

Test cases:

    print $ closestToAverage db1 == "cheese"
    print $ closestToAverage db2 == "butter"
    
    print $ cheaperAlternative db1 == 0
    print $ cheaperAlternative db2 == 1

# Task 10

Define a function that accepts a list of three-dimensional points and returns the closest distance between any two points.

Test case:

    print $ getClosestDistance [(4, 5, 6), (2, 5, 10), (5, 2, (-10)), ((-2), 1, 45), (12, 0, 2), (6, 5, 4)] == 2.83

# Tasks 11 ..

Open and solve "test1_2021.pdf" and "test1_2020.pdf".

Test cases:

    -- test1_2021.pdf

    -- Task 1
    print $ sumOfEvenly 1 10 == 41
    print $ sumOfEvenly 5 20 == 175

    -- Task 2
    print $ (kthMaxMin [-1]) 1 == -1
    -- print $ (kthMaxMin [-1,0,-1,0,-2,3,1,-1]) 3 -- error “No such number”
    print $ (kthMaxMin [-1,-5,-6,-6,-6,-6]) 2 == -5
    print $ (kthMaxMin [1,2,3,4,-5,6,7,-2,-1,0]) 2 == -2

    -- Task 3
    print $ persistence 39 == (3,[27,14,4])
    print $ persistence 999 == (4,[729,126,12,2])
    print $ persistence 126 == (2,[12,2])
    print $ persistence 4 == (1,[4])

    -- Task 4
    print $ scoreHand ["A"] == 11
    print $ scoreHand ["A","J"] == 21
    print $ scoreHand ["5","3","7"] == 15
    print $ scoreHand ["5","4","3","2","A","K"] == 25
    print $ scoreHand ["2","3"] == 5
    print $ scoreHand ["4","5","6"] == 15
    print $ scoreHand ["7","7","8"] == 22
    print $ scoreHand ["K","J","Q"] == 30
    print $ scoreHand ["A","3"] == 14
    print $ scoreHand ["A","A"] == 12
    print $ scoreHand ["A", "10", "A"] == 12
    print $ scoreHand ["A","2","A","9","9"] == 22


    -- test1_2020.pdf

    -- Task 1
    print $ checkSequence [2, 9, 15] == True
    print $ checkSequence [11, 14, 20, 27, 31] == True
    print $ checkSequence [11, 14, 28, 27, 31] == False
    print $ checkSequence [11, 14, 14, 29, 31] == False

    -- Task 2
    print $ removNb 26 == [(15,21),(21,15)]
    print $ removNb 100 == []
    print $ removNb 101 == [(55,91),(91,55)]

    -- Task 3
    -- construct it
