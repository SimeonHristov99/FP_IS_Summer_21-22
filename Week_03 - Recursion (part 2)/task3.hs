main :: IO()
main = do
    print $ findMax 55345 == 5
    print $ findMax 14752 == 7
    print $ findMax 329450 == 9
    print $ findMax 9521 == 9

findMax :: Int -> Int
findMax n = helper n 0
    where 
        helper :: Int -> Int -> Int
        helper 0 currMax = currMax
        helper num currMax
         | (mod num 10) > currMax = helper (div num 10) (mod num 10)
         | otherwise = helper (div num 10) currMax

findMax' :: Int -> Int
findMax' n = helper n 0
    where 
        helper :: Int -> Int -> Int
        helper 0 currMax = currMax
        helper _ 9 = 9
        helper num currMax
         | (mod num 10) > currMax = helper (div num 10) (mod num 10)
         | otherwise = helper (div num 10) currMax