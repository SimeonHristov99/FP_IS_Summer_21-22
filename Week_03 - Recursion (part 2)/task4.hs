main :: IO()
main = do
    print $ sumNumbers 1 9 == 45
    print $ sumNumbers 199 203 == 200
    print $ sumNumbers 219 225 == 663
    print $ sumNumbers 225 219 == 663

sumNumbers :: Int -> Int -> Int
sumNumbers start finish = helper $ min start finish
--  | start > finish = sumNumbers finish start
--  | otherwise = helper start
 where
     helper :: Int -> Int
     helper i 
      | i > max start finish = 0
      | hasDecDigits i = i + helper (i+1)
      | otherwise = helper (i+1) 

hasDecDigits :: Int -> Bool
hasDecDigits n = n < 10 || mod n 10 <= mod (div n 10) 10 && hasDecDigits (div n 10)