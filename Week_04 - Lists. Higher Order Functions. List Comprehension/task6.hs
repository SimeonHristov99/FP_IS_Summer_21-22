main :: IO()
main = do
    print $ removeAllRec 5 [5] == []
    print $ removeAllRec 4 [4, 4] == []
    print $ removeAllRec 5 [1] == [1]
    print $ removeAllRec 5 [5, 1, 5, 3, 5] == [1, 3]
    print $ removeAllRec 3 [5, 1, 5, 3, 5] == [5, 1, 5, 5]

    print $ removeAllHOF 5 [5] == []
    print $ removeAllHOF 4 [4, 4] == []
    print $ removeAllHOF 5 [1] == [1]
    print $ removeAllHOF 5 [5, 1, 5, 3, 5] == [1, 3]
    print $ removeAllHOF 3 [5, 1, 5, 3, 5] == [5, 1, 5, 5]

removeAllHOF :: Int -> [Int] -> [Int]
removeAllHOF n xs = filter (/= n) xs

removeAllRec :: Int -> [Int] -> [Int]
removeAllRec _ [] = []
removeAllRec n (x:xs)
 | x == n = removeAllRec n xs
 | otherwise = x : removeAllRec n xs