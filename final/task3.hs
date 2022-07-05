import Data.List

main :: IO()
main = do
    print $ bounds [3, 7, 5, 6, 9] == (1, 3)
    print $ bounds [3, 4, 5, 6, -1] == (0, 4)
    print $ bounds [3, -4, 5, 6] == (0, 1)

bounds :: [Int] -> (Int, Int)
bounds xs = (head diffIndices, last diffIndices)
 where
    diffIndices = [ idx | (n1, n2, idx) <- zip3 (sort xs) xs [0 .. ], n1 /= n2 ]