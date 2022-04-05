main :: IO()
main = do
    -- print $ "Hello"
    print $ sumOfEvenly 1 10 == 41
    print $ sumOfEvenly 5 20 == 175

    print $ sumOfEvenly' 1 10 == 41
    print $ sumOfEvenly' 5 20 == 175

    -- print $ (\ x -> x + 1) [1, 2, 3]
    -- print $  [1, 2, 3]
    -- (\ x -> mod n x == 0) 1
    -- (\ x -> mod n x == 0) 2
    -- (\ x -> mod n x == 0) 3

sumOfEvenly' :: Int -> Int -> Int
sumOfEvenly' a b = sum $ filter (\ x -> even $ countOfDiv' x) [a .. b]

countOfDiv' :: Int -> Int
countOfDiv' n = length $ filter (\ x -> mod n x == 0) [1 .. n]

sumOfEvenly :: Int -> Int -> Int
sumOfEvenly a b
 | a > b = 0
 | even (countOfDiv a)= a + sumOfEvenly(a+1) b
 | otherwise = sumOfEvenly (a+1)b

countOfDiv:: Int-> Int
countOfDiv n = helper 1 0
 where 
     helper :: Int->Int -> Int
     helper i count 
      |i >= n = (count+1)
      |mod n i == 0 = helper (i+1)(count+1)
      |otherwise =helper (i+1)(count)