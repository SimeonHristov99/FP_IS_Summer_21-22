## Task 1

Given a directed graph *g* with edges `[(1, 2), (1, 3), (2, 3), (2, 4)]` define the following functions:

    nodes - returns all the nodes of "g";
    neighbours - accepts a node and returns its neighbours;
    adjacencyList - returns the children of every parent.

Test cases:

    print $ nodes [(1, 2), (1, 3), (2, 3), (2, 4)] == [1, 2, 3, 4]
    print $ neighbours [(1, 2), (1, 3), (2, 3), (2, 4)] 2 == [3, 4]
    print $ neighbours [(1, 2), (1, 3), (2, 3), (2, 4)] 4 == []
    print $ adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] == [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])]

## Task 2

Define a function that checks whether a given path is valid in a graph `g = (1, [2, 3]), (2, [3, 4]), (3, []), (4, [])`.

Test cases:

    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] == False
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] == False

## Task 3

Define a new data type called "Shape". Shape must have four constructors:

- Circle: with one argument representing the radius;
- Rectangle: with two arguments representing the width and height;
- Triangle;
- Cylinder with two arguments for the radius of the base and height.

Create a shape from every type and output it.

## Task 4

Create a new data type called `Point2D` and define a function that accepts two functions: *f* and *g* and a list of points with two coordinates. The function should return those points for which `f(firstCoordinate) = g(secondCoordinate)` and should be able to work with whole as well as floating point numbers!

Test case:

    print $ myImages (\x -> x * x) (2+) [Point 2 2, Point 1 2, Point 3 7] == [Point 2 2, Point 3 7]

## Task 5

By using the "Shape" data type, define the following functions:

    isRound - returns whether a shape has a round side;
    is2D - returns whether a shape has two dimensions.

Test cases:

    print $ isRound (Circle 5) == True
    print $ isRound (Rectangle 2.5 4.5) == False
    print $ isRound (Rectangle 5.5 20.6) == False
    print $ isRound (Triangle 5.3 3.9 4.89) == False
    print $ isRound (Cylinder 20 30) == True

    print $ is2D (Circle 5) == True
    print $ is2D (Rectangle 2.5 4.5) == True
    print $ is2D (Rectangle 5.5 20.6) == True
    print $ is2D (Triangle 5.3 3.9 4.89) == True
    print $ is2D (Cylinder 20 30) == False

# For home

## Task 1

Define a function that accepts a graph, a whole number *k* and a node *n*. Return all the paths starting from *n* that are *k* nodes long. If the node is not present, throw an error.

Use the following types:

    type Node = Int
    type Graph = [(Node, [Node])]
    type Path = [Node]

Test cases:

    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 == [[1]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 == [[1, 2], [1, 3]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 == [[1, 2, 3], [1, 2, 4]]
    print $ simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 == [[2,3],[2,4]]

## Task 2

Let (x, y, z) be a vector representing the nodes of a binary tree such that x is the value of the current node, y and z are the values of the child nodes. Define a function that returns the leaves of such a tree.

Test cases:

    print $ listLeaves [(1, 2, 3), (2, 4, 5)] == [4, 3, 5]
    print $ listLeaves [(2, 4, 5), (1, 2, 3)] == [4, 5, 3]
    print $ listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] == [2, 4, 6, 9]

## Task 3

By using the "Shape" data type, define the following functions:

    perimeter;
    area.

Test cases:

    print $ perimeter (Circle 5) == 31.41592653589793
    print $ perimeter (Rectangle 2.5 4.5) == 14
    print $ perimeter (Rectangle 5.5 20.6) == 52.2
    print $ perimeter (Triangle 5.3 3.9 4.89) == 14.09
    print $ perimeter (Cylinder 2.5 10) == 30
   
    print $ area (Circle 5) == 78.53981633974483
    print $ area (Rectangle 2.5 4.5) == 11.25
    print $ area (Rectangle 5.5 20.6) == 113.30000000000001
    print $ area (Triangle 5.3 3.9 4.89) == 9.127927385194024
    print $ area (Cylinder 20 30) == 6283.185307179587

Note:

    Perimeter of a cylinder: 4*r + 2*h
    Area of a cylinder: 2*pi*r*h + 2*pi*r*r.

## Task 4

By using the "Shape" data type, define two functions that accept a list of shapes and:

    1. The first returns their areas;
    2. The second returns the shape with the biggest area. !! SOLVE USING FOLDING !!

Test cases:

    print $ getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == [78.53981633974483,11.25,113.30000000000001,9.127927385194024,6283.185307179587]
    print $ maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == Cylinder 20.0 30.0
