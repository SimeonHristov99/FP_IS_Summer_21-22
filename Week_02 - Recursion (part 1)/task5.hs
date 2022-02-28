main :: IO()
main = do
    print $ sumDivs 0 == 0
    print $ sumDivs 1 == 1
    print $ sumDivs 6 == 12 -- 1 + 2 + 3 + 6
    print $ sumDivs 12345 == 19776

    print $ sumDivs' 0 == 0
    print $ sumDivs' 1 == 1
    print $ sumDivs' 6 == 12 -- 1 + 2 + 3 + 6
    print $ sumDivs' 12345 == 19776

sumDivs :: Int -> Int
sumDivs n
 | n < 0 = error "n has to be non-negative"
 | otherwise = helper 1 0
  where
      helper :: Int -> Int -> Int
      helper currentDiv result
       | currentDiv > n = result
       | mod n currentDiv == 0 = helper (currentDiv + 1) (result + currentDiv)
       | otherwise = helper (currentDiv + 1) result

sumDivs' :: Int -> Int
sumDivs' n
 | n < 0 = error "n has to be non-negative"
 | otherwise = helper 1
  where
      helper :: Int -> Int
      helper currentDiv
       | currentDiv >= n = n -- || currentDiv > n = 0
       | mod n currentDiv == 0 = currentDiv + helper (currentDiv + 1)
       | otherwise = helper (currentDiv + 1)
