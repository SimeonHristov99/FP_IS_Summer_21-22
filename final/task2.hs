main :: IO()
main = do
    print $ prodEvens [1,2,3,4,5,6] == 15
    print $ prodEvens [7.66,7,7.99,7] == 61.2034

prodEvens :: (Num a) => [a] -> a
prodEvens = foldr (\ (idx, n) acc -> if even idx then acc * n else acc) 1 . zip [0 .. ]
