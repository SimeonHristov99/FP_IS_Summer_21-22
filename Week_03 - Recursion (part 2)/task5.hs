main :: IO ()
main = do
    print $ subNum 123 5123783 == True -- x = 123, y = 5123783
    print $ subNum 0 0 == True
    print $ subNum 10 101 == True
    print $ subNum 101 101 == True
    print $ subNum 10 0 == False
    print $ subNum 1253 5123783 == False
    print $ subNum 12 0 == False

numDig :: Int -> Int
numDig n
 | n < 0 = error "n was negative"
 | n < 10 = 1
 | otherwise = 1 + numDig (div n 10)

subNum :: Int -> Int -> Bool
subNum x y = helper y (10^numDig x)
 where
  helper :: Int -> Int -> Bool
  helper y dNum
   | x > y = False
   | mod y dNum == x = True
   |otherwise = helper (div y 10) dNum 