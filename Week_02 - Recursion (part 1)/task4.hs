main :: IO()
main = do
    print $ isPrime 1 == False
    print $ isPrime 2 == True
    print $ isPrime 3 == True
    print $ isPrime 6 == False
    print $ isPrime 61 == True

isPrime :: Int -> Bool
isPrime n = n > 1 && helper 2
 where
     helper :: Int -> Bool
     helper i
      | (fromIntegral i) >= (sqrt $ fromIntegral n) = True
      | mod n i == 0 = False
      | otherwise = helper (i + 1)