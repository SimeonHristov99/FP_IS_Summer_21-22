main :: IO()
main = do
    print $ powRec 2 5 == 32
    print $ powRec 15 3 == 3375

    print $ powIter 2 5 == 32
    print $ powIter 15 3 == 3375

    -- print $ powIter 2 0 == 1 -- should return an error (according to the task description)

powRec :: Double -> Int -> Double
powRec x 1 = x
powRec x n
 | n < 1 = error "n has to be positive"
 | otherwise = x * powRec x (n - 1)

powIter :: Double -> Int -> Double
powIter x n
 | n < 1 = error "n has to be positive"
 | otherwise = helper x n
  where
      helper :: Double -> Int -> Double
      helper result 1 = result
      helper result n = helper (result * x) (n - 1)