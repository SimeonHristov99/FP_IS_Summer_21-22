main :: IO()
main = do
    print $ (getIndices [2, 7, 11, 15]) 9 == (0,1) --2 + 7 = 9
    print $ (getIndices [3, 2, 4]) 6 == (1,2)
    print $ (getIndices [3, 3]) 6 == (0,1)

getIndices :: [Int] -> (Int -> (Int, Int))
getIndices xs = (\ x -> head [ (i1, i2) | (x1, i1) <- zip xs [0 ..], (x2, i2) <- zip xs [0 ..], i1 /= i2, x1 + x2 == x ] ) 