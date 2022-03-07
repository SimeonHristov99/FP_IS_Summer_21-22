main :: IO()
main = do
    print $ digitalRoot 16 == 7
-- => 1 + 6
-- => 7
    print $ digitalRoot 942 == 6
-- => 9 + 4 + 2
-- => 15 ...
-- => 1 + 5
-- => 6
    print $ digitalRoot 132189 == 6
    print $ digitalRoot 493193 == 2

digitalRoot :: Int -> Int 
digitalRoot n 
 | n <= 9 = n
 | otherwise = digitalRoot (sumDigits n)

sumDigits :: Int -> Int 
sumDigits n 
   | div n 10 == 0 = n
   | otherwise = mod n 10 + sumDigits (div n 10)
   