main :: IO()
main = do
    print $ reverseOrdSuff 37563 == 36
    print $ reverseOrdSuff 32763 == 367
    print $ reverseOrdSuff 32567 == 7
    print $ reverseOrdSuff 32666 == 6

reverseOrdSuff :: Int -> Int
reverseOrdSuff n = helper (div n 10) (mod n 10)
 where
     helper :: Int -> Int -> Int
     helper 0 result = result
     helper leftover result
      | mod leftover 10 > mod result 10 = helper (div leftover 10) (result * 10 + mod leftover 10)
      | otherwise = result