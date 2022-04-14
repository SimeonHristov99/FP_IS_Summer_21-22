main :: IO()
main = do
    print $ primesProd 9 == 2
    print $ primesProd 12 == 6
    print $ primesProd 1200 == 200560490130

isPrime :: Int -> Bool
isPrime n = n > 1 && [] == filter ((== 0) . (n `mod`)) [2 .. n - 1]

primesProd :: Int -> Int
primesProd 0 = 0
primesProd x = helper 1
 where
     helper :: Int -> Int
     helper d
      | d * d >= x = 1
      | isPrime d = d * helper (d + 1)
      | otherwise = helper (d + 1)