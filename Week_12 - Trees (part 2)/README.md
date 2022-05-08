# Task 1

Define the following tree by using a polymorphic algebraic type and complete the steps below:

![Alt text](assets/task3.png?raw=true "task3.png")

```text
1. print it;
2. define a function that:
    - returns its size;
    - returns the elements at level k.
```

Test cases:

```haskell
print $ t
print $ size t == 13
print $ getLevel t 2 == [5, 8, 9, 11, 13, 6, 4]
```

# Task 2

![tree_task3](assets/tree.png?raw=true)

Test case:

```haskell
print $ numOfNodes t == 2 -- 8 and 12
```

`t`:
```haskell
t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]
```

# Task 3

![tree_task3](assets/t4.png?raw=true)

`t1`:

         8
       /  \
      3    10
     / \   /  \
    1   4 9   14

`t2`:

         8
       /    \
      3      10
     / \     /  \
    9   10  11   14

Test cases:

```haskell
print $ grandchildrenIncreased t1 == False
print $ grandchildrenIncreased t2 == True
```

Trees used:

```haskell
t1 = Node 8 (Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)) (Node 10 (Node 9 Empty Empty) (Node 14 Empty Empty))

t2 = Node 8 (Node 3 (Node 9 Empty Empty) (Node 10 Empty Empty)) (Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty))
```

# Task 4

![tree_task3](assets/t5.png?raw=true)

Test cases:

```haskell
print $ isSymmetric Empty == True
print $ isSymmetric t3 == False
print $ isSymmetric t4 == True
print $ isSymmetric t5 == True
```

Trees used:

```haskell
t3 :: BTree                         --   1
t3 = Node 1 (Node 2 Empty Empty)    --  / \
            (Node 3 Empty Empty)    -- 2   3

t4 :: BTree                                 --     1
t4 = Node 1 (Node 2 (Node 3 Empty Empty)    --    / \
                    Empty)                  --   2   2
            (Node 2 Empty                   --  /     \
                    (Node 3 Empty Empty))   -- 3       3

t5 :: BTree                                         --       1
t5 = Node 1 (Node 2 (Node 3 Empty Empty)            --    /     \
                    (Node 7 (Node 5 Empty Empty)    --   2       2
                            Empty))                 --  / \     / \
            (Node 2 (Node 7 Empty                   -- 3   7   7   3
                            (Node 5 Empty Empty))   --    /     \
                    (Node 3 Empty Empty))           --   5       5
```

# Task 5

![tree_task3](assets/t6.png?raw=true)

Test cases:

```haskell
print $ flatten (List []) == []
print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == [1,2,3,4,5]
print $ flatten (Elem 1) == [1]
```

# For home

# Task 1

Define a function that accepts an infinite list of numbers [x<sub>1</sub>, x<sub>2</sub> .. ] and returns a function that for every `x` and `y` calculates the expression (x - x<sub>1</sub>)(x - x<sub>2</sub>) .. (x - x<sub>y</sub>).

Test case:

    If g is myPoly [2.7, 3.0 ..]
        then g 2.2 3 -> -0.4399999999999998

# Task 2

Define a function that accepts a list of countries and returns the name of the country with the highest capital, i.e. the capital on the highest elevation.

> **Implementation detail**: Solve the task using folding.

Use the following types:

```haskell
type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int
data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]
```

Test cases:

```haskell
print $ highestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Bulgaria"
```

# Task 3

Define a function that returns the depth of the deepest blue node.

Use the following types:

```haskell
data Color = Red | Green | Blue
data Tree = Empty | Node Color Tree Tree
```

`colorTree`:

           Blue
          /    \
       Red      Red
       /        /  
    Green     Blue  
              /   \
           Green  Red

Test case:

```haskell
print $ maxDepthBlueNode colorTree == 2
```

# Task 4

![tree_task2](assets/fh_task2.png?raw=true)
