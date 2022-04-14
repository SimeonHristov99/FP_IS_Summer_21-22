main :: IO()
main = do
    print $ findSmallest [2, 5, 3, 7, 8, 1, 9] == [-1, 2, 2, 3, 7, -1, 1]
    print $ findSmallest [5, 7, 4, 9, 8, 10] == [-1, 5, -1, 4, 4, 8]
    print $ findSmallest [1, 5, 2, 2, 2, 5, 5, 4] == [-1, 1, 1, 1, 1, 2, 2, 2]

findSmallest :: (Num a, Ord a) => [a] -> [a]
findSmallest xs = helper xs []
 where
     helper :: (Num a, Ord a) => [a] -> [a] -> [a]
     helper [] _ = []
     helper (x:xs) [] = (-1) : helper xs [x]
     helper (x:xs) (prev:prevs)
      | prev < x = prev : helper xs (x:prev:prevs)
      | otherwise = helper (x:xs) prevs
