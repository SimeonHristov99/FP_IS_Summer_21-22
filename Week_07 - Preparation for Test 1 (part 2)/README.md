# Tasks 1, 2, 3, 4

Resolve last year's test 1.

Test cases:

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

# For home

## Task 1

A product has a name, quantity (in grams/milliliters) and a price. A shop has products, thus we can use it as a database.

Available products at the shop:

- Bread: 1kg for 1.20;
- Milk: 2L for 4.50;
- Lamb: 5kg for 10.00;
- Cheese: 750g for 5.00;
- Butter: 1kg for 5.50;
- Water: 500ml for 0.50;
- Soap: 250g for 4.50.

Database:

    db :: Shop
    db = [("bread", 1000, 1.20), ("milk", 2000, 4.5), ("lamb", 5000, 10), ("cheese", 750, 5), ("butter", 1000, 5.50), ("water", 500, 0.50), ("soap", 250, 4.50)]

Complete the tasks below:

- define a function that returns the price of the inventory. Solve the task with one line of code.

Test case:

    print $ getTotal db == 31.2

- define a functon that returns the average price of the products. Solve the task with one line of code.

Test case:

    print $ getAverage db == 4.457142857142857

- define a function that takes a quantity and returns all products not available in larger quantities. Solve the task with one line of code.

Test case:

    print $ getNeeded 750 == [("cheese",750,5.0),("water",500,0.5),("soap",250,4.5)]

- define a function that takes the name and price of a product and returns the number of cheaper alternatives. Solve the task with one line of code.

Test cases:

    print $ cheapestAlternative "lamb" 5.50 == 0
    print $ cheapestAlternative "milk" 5.00 == 1

- define a function that simulates the result of buying a product. The function takes the name and quantity of the desired product. It then checks the database for that product. If the quantity desired is equal to the one available the product is removed from the shop. Otherwise, its amount is reduced. Make sure it is in the database and has sufficient quantity!

Test cases:

    print $ buy "bread" 500 db == [("bread",500,1.2),("milk",2000,4.5),("lamb",5000,10.0),("cheese",750,5.0),("butter",1000,5.5),("water",500,0.5),("soap",250,4.5)]
    print $ (buy "water" 500 $ buy "bread" 500 db) == [("bread",500,1.2),("milk",2000,4.5),("lamb",5000,10.0),("cheese",750,5.0),("butter",1000,5.5),("soap",250,4.5)]
    print $ (buy "soap" 100 $ buy "water" 500 $ buy "bread" 500 db) == [("bread",500,1.2),("milk",2000,4.5),("lamb",5000,10.0),("cheese",750,5.0),("butter",1000,5.5),("soap",150,4.5)]
    print $ (buy "bread" 500 $ buy "soap" 100 $ buy "water" 500 $ buy "bread" 500 db) == [("milk",2000,4.5),("lamb",5000,10.0),("cheese",750,5.0),("butter",1000,5.5),("soap",150,4.5)]
    -- print $ (buy "water" 100 $ buy "bread" 500 $ buy "soap" 100 $ buy "water" 500 $ buy "bread" 500 db) -- error: Out of stock!
    -- print $ (buy "soap" 200 $ buy "bread" 500 $ buy "soap" 100 $ buy "water" 500 $ buy "bread" 500 db) -- error: Out of stock!

## Task 2

Define a function that takes a whole number and returns its ascending left suffix. The ascending left suffix of a number is the number that forms a strictly ascending sequence, if read from right to left.

Test cases:

    print $ reverseOrdSuff 37563 == 36
    print $ reverseOrdSuff 32763 == 367
    print $ reverseOrdSuff 32567 == 7
    print $ reverseOrdSuff 32666 == 6

## Task 3

Define a function that accepts a list of three-dimensional points and returns the closest distance between any two points.

Test case:

    print $ getClosestDistance [(4, 5, 6), (2, 5, 10), (5, 2, (-10)), ((-2), 1, 45), (12, 0, 2), (6, 5, 4)] == 2.83
