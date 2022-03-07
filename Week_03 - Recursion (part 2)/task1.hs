main :: IO()
main = do
    print $ isNarcissistic 7 == True
    print $ isNarcissistic 12 == False
    print $ isNarcissistic 370 == True
    print $ isNarcissistic 371 == True
    print $ isNarcissistic 1634 == True

numDig :: Int -> Int
numDig n
 | n < 0 = error "n was negative"
 | n < 10 = 1
 | otherwise = 1 + numDig (div n 10)

isNarcissistic :: Int -> Bool
isNarcissistic n = n == helper n (numDig n)
 where
     helper :: Int -> Int -> Int
     helper 0 nd = 0
     helper leftover nd = (mod leftover 10)^nd + helper (div leftover 10) nd
     