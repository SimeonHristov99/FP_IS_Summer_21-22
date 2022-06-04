# Task 0

Solve the sample theory exam (`Theory.pdf`).

# Task 1

Define a function that accepts a unary function and a list of numbers [y<sub>1</sub>, y<sub>2</sub> .. y<sub>n</sub>] and returns a function that for every `x` calculates the expression: f(y<sub>1</sub>x) + 2 f(y<sub>2</sub>x) + .. + n f(y<sub>n</sub>x).

> **Implementation detail**: Solve the task with `one line` of code and `typeclasses`!

Test cases:

    If g is myPolynomial (\x -> x - 2) [],
        then g 5 -> 0
    If g is myPolynomial (\x -> x + 10) [3.62, 6.12, 9.45, 8.02, 5, 2],
        then g (-5) -> -356.45
    If g is myPolynomial (\x -> x - 2) [1, 4, 7, 8, 5, 2]
        then g 5 -> 453

# Task 2

Define a function that accepts a unary function and a list of numbers [y<sub>1</sub>, y<sub>2</sub> .. y<sub>n</sub>] and returns a function that accepts `x` and calculates the expression: y<sub>1</sub>f(x) + y<sub>2</sub>f(x<sup>2</sup>) + .. + y<sub>n</sub>f(x<sup>n</sup>) .

> **Implementation detail**: Solve the task with `one line` of code and `typeclasses`!

Test cases:

```haskell
print $ (sumExpr (2+) [0, 1, 2, 3]) 2 == 80
print $ (sumExpr (*0.8) [0, 1, 2, 3, 4, 5]) 10 == 4345680.0
```

# Task 3

Define a function that accepts a unary function `f` and a number `y` and returns a unary function that for every `x` returns:

- `y`, if it is greater than or equal to the result of applying `f` to `x`;
- the result of applying `f` to `x`, otherwise.

> **Implementation detail**: Solve the task with `one line` of code and `typeclasses`!

Test cases:

    If g is upperBound (*2) 100
        then g 50 -> 100
    If g is upperBound (*2) 100.236
        then g 500.002 -> 1000.004
    If g is upperBound (\x -> x) 1.001
        then g 1.001 -> 1.001

# Task 4

Define a function that accepts a list of whole number unary functions [f<sub>1</sub>, f<sub>2</sub> .. f<sub>n</sub>] and returns a function that for every `x` calculates the composition of the functions with odd indices: f<sub>1</sub>(f<sub>3</sub>(...(f<sub>n</sub>x)...)).

> **Implementation detail**: Solve the task with `one line` of code using `folding`.

Test case:

```haskell
print $ (getOddCompositionValue [(\x -> x + 1),(\x -> x * 2),(\x -> x - 1), (\x -> div x 2)]) 2 == 2
print $ (getOddCompositionValue [id, (5-), (\x -> mod x 2)]) 15 == 1
```

# Task 5

Define a function that returns the depth of the shallowest green node.

Use the following types:

```haskell
data Color = Red | Green | Blue
data Tree = Empty | Node Color Tree Tree
```

colorTree:

           Blue
          /    \
       Red      Red
       /        /  
    Green     Blue  
              /   \
           Green  Red

Test case:

```haskell
print $ minDepthGreenNode colorTree == 2
```

# Task 6

Define a function that returns the depth of the deepest blue node.

Use the following types:

```haskell
data Color = Red | Green | Blue
data Tree = Empty | Node Color Tree Tree
```

colorTree:

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

# Task 7

Define a function that accepts a list of countries and returns the name of the country with the lowest average yearly temperature (the `coldest country`).

> **Implemenation detail**: Solve the task using `folding`!

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
print $ coldestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Germany"
```

# Task 8

Define a function that accepts a list of countries and returns the name of the country with the highest capital, i.e. the capital on the highest elevation.

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

# Task 9

Define a function that accepts an infinite list of numbers [x<sub>1</sub>, x<sub>2</sub> .. ] and returns a function that for every `x` and `y` calculates the expression (x - x<sub>1</sub>)(x - x<sub>2</sub>) .. (x - x<sub>y</sub>).

Test case:

    If g is myPoly [2.7, 3.0 ..]
        then g 2.2 3 -> -0.4399999999999998

# Tasks 10 ..

If there is time, pick tasks from `For Home` that you think are the `hardest` and we'll solve them!
