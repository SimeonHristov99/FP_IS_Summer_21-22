main :: IO()
main = do
    print $ calculateSum' 5 0 == 1 -- x=5, n=0
    print $ calculateSum' 5 1 == 6
    print $ calculateSum' 10 1 == 11
    print $ calculateSum' 1 11 == 12
    print $ calculateSum' 2 11 == 4095

calculateSum :: Int -> Int -> Int
calculateSum x n = helper 0 0
 where
  helper :: Int -> Int -> Int
  helper sumOfDegree degree
   |n<=degree = sumOfDegree + x ^ degree
   |otherwise = helper (sumOfDegree+x^degree) (degree+1)

{-
calculateSum' :: Int -> Int -> Int
calculateSum' x n = helper 0 0
 where
  helper :: Int -> Int -> Int
  helper sumOfDegree n = sumOfDegree + x ^ n
  helper sumOfDegree degree = helper (sumOfDegree+x^degree) (degree+1)
-}