# Task 1

Define a new **polymorphic** algrebraic data type called `Point`. A point may have two or three dimensions. Create an instance for every dimension and print it.

# Task 2

![Alt text](assets/graph1.png?raw=true "t.png")
![Alt text](assets/graph2.png?raw=true "t.png")
![Alt text](assets/graph3.png?raw=true "t.png")

# Task 3

Нека е дефинирана следната структура на база от данни:

```haskell
type Name = String
type Date = String
type Class = String
type Result = String
type Launched = Int

data Battle = Battle Name Date
 deriving (Show)
data Ship = Ship Name Class Launched
 deriving (Show)
data Outcome = Outcome Name Name Result
 deriving (Show)

type Database = ([Outcome], [Battle], [Ship])
```

Алгебричният тип `Battle` представя данните за дадена битка - нейното име и датата, на която се е състояла. Алгебричният тип `Ship` представя данните за даден кораб - неговото име и годината на пускането му във вода. Алгебричният тип `Outcome` представя данните за резултата за даден кораб от дадена битка - името на кораба, името на битката и резултата за кораба - дали е бил повреден (`damaged`), потънал (`sunk`), или неповреден (`ok`).

Дефинирайте функция, която получава като аргумент база от данни и връща имената на всички кораби, потънали в битка, под формата на списък от двойки от вида `(<име на битка>,<списък от имена на кораби, потънали в тази битка>)`.

Примери:

```haskell
print $ getSunk database == [("Guadalcanal",["Kirishima"]),("North Atlantic",["Bismarck","Hood"]),("North Cape",["Schamhorst"]),("Surigao Strait",["Yamashiro","Fuso"])]
```

Here is what the full database looks like:

![Alt text](assets/shipDB.png?raw=true "shipDB")

# Task 4

Нека имаме следната структура на филмова база от данни:

```haskell
type Name = String
type Title = String
type Address = String
type Year = Int
type Gender = Char
type Length = Int

type ProducerID = Int
type Networth = Integer

data Movie = Movie Title Year Length Name ProducerID
 deriving (Show)
data MovieStar = MovieStar Name Gender
 deriving (Show)
data StarsIn = StarsIn Name Title
 deriving (Show)

data Studio = Studio Name Int
 deriving (Show)
data MovieExec = MovieExec Name ProducerID Networth
 deriving (Show)

type MovieDB = ([Movie], [MovieStar], [StarsIn], [Studio], [MovieExec])
```

Алгебричният тип `Movie` представя данните за даден филм - неговото име, годината му на излизане, продължителността му, името на студиото, което го e създало и номерът на продуцента. Алгебричният тип `MovieStar` представя данните за даден актьор - неговото име и пол. Алгебричният тип `StarsIn` свързва име на актьор с филм, в който той участва. Алгебричният тип `Studio` представя данните за дадено студио - неговото име и номера на неговия президент (който е и продуцент). Алгебричният тип `MovieExec` представя данните за даден продуцент - неговото име, номер и нетна стойност на активите. Стойностите от тип `MovieDB` са вектори с пет елемента - списъци, които представят базата от данни. Петте списъка съдържат съответно всички налични данни за филми, актьори, участия на актьори във филми, студиа и продуценти.

Напишете следните функции:

- функция, която получава като аргументи име на студио, година и база от данни за филми и извежда имената на актьорите, участвали във филми, продуцирани от зададеното студио през зададената година;

- функция, която по име на студио и база от данни за филми извежда името на президента на зададеното студио.

Примери:

```haskell
print $ getFeaturedStars "MGM" 1995 db == ["Jack Nicholson", "Sandra Bulloc"]
print $ getFeaturedStars "USA Entertainm." 2001 db == ["Billy Bob Thornton", "Scarlett Johansson", "Orlando Bloom", "Cate Blanchett", "Liv Tyler"]

print $ getPresident "Paramount" db == "Calvin Coolidge"
print $ getPresident "Fox" db == "Ted Turner"
print $ getPresident "USA Entertainm." db == "Stephen Spielberg"
```

Here is what the full database looks like:

![Alt text](assets/movieDB.png?raw=true "movieDB")

# For home

# Task 1

Define a function that accepts a unary function and a list of numbers [y<sub>1</sub>, y<sub>2</sub> .. y<sub>n</sub>] and returns a function that accepts `x` and calculates the expression: y<sub>1</sub>f(x) + y<sub>2</sub>f(x<sup>2</sup>) + .. + y<sub>n</sub>f(x<sup>n</sup>) .

> **Implementation detail**: Solve the task with `one line` of code and `typeclasses`!

Test cases:

```haskell
print $ (sumExpr (2+) [0, 1, 2, 3]) 2 == 80
print $ (sumExpr (*0.8) [0, 1, 2, 3, 4, 5]) 10 == 4345680.0
```

# Task 2

Define a function that accepts a list of countries and returns the name of the country with the lowest average yearly temperature (the `coldest` country).

> **Implemenation detail**: Solve the task using folding!

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

# Task 3

By using the algrbraic type we defined in class (task 1) define a function that accepts a list of points and returns a vector `(Double, Point, Point)` that represents the closest distance between any two points, and the points themselves.

Test case:

```haskell
print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10)] == (4.47213595499958,ThreeD 4.0 5.0 6.0,ThreeD 2.0 5.0 10.0)
print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2)] == (4.47213595499958,ThreeD 4.0 5.0 6.0,ThreeD 2.0 5.0 10.0)
print $ getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] == (2.8284271247461903,ThreeD 4.0 5.0 6.0,ThreeD 6.0 5.0 4.0)

print $ getClosestDistance [(TwoD 4 6), (TwoD 5 10), (TwoD 5 29), (TwoD 1 45), (TwoD 0 2), (TwoD 69 42)] == (4.123105625617661,TwoD 4.0 6.0,TwoD 5.0 10.0)
```

# Task 4

Define a function that returns all the uncles of a node in a tree. An uncle is a brother of a parent.

![Alt text](assets/t.png?raw=true "t.png")

Use the following type and representation:

```haskell
type Tree = [(Int, [Int])]

t :: Tree
t = [(1,[2,3,4]),(2,[5,6]),(3,[7]),(4,[8,9]),(5,[]),(6,[10]),(7,[]),(8,[]),(9,[]),(10,[])]
```

Test cases:

```haskell
print $ findUncles t 5 == [3,4]
print $ findUncles t 7 == [2,4]
print $ findUncles t 10 == [5]
```
