main :: IO()
main = do
    print $ isPerfect 1 == False -- the sum of the divisors is 0, because of the hint
    print $ isPerfect 6 == True -- 1 + 2 + 3 = 6 = 6
    print $ isPerfect 495 == False
    print $ isPerfect 33550336 == True

sumDivs :: Int -> Int
sumDivs n = helper 1 0
 where
     helper :: Int -> Int -> Int
     helper currentDiv result
      | currentDiv >= n - 1 = result
      | mod n currentDiv == 0 = helper (currentDiv + 1) (result + currentDiv)
      | otherwise = helper (currentDiv + 1) result

isPerfect :: Int -> Bool
isPerfect n = n == sumDivs n