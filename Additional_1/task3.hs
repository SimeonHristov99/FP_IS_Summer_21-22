main :: IO()
main = do
    print $ isArithmentic [1, 2, 3, 4, 5]
    print $ onlyArithmentic [[3], [1, 2, 3, 4, 5], [3, 5, 8, 9, 11]]  == [[3], [1, 2, 3, 4, 5]]
    -- print $ takeWhile even [1, 2, 3] == []
    -- print $ takeWhile even [2, 4, 3] == [2, 4]
    print $ (\ x -> x + 1) 5

isArithmentic :: (Eq a, Enum a) => [a] -> Bool
isArithmentic xs = length xs < 2 || xs == take (length xs) [xs!!0, xs!!1 ..]

onlyArithmentic :: (Eq a, Enum a) => [[a]] -> [[a]]
onlyArithmentic xss = [ xs | xs <- xss, isArithmentic xs]

onlyArithmentic' :: (Eq a, Enum a) => [[a]] -> [[a]]
onlyArithmentic' = filter isArithmentic