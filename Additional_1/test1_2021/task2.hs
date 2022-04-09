import Data.List

main :: IO()
main = do
    print $ (kthMaxMin [-1]) 1 == -1
    -- print $ (kthMaxMin [-1,0,-1,0,-2,3,1,-1]) 3 -- error “No such number”
    print $ (kthMaxMin [-1,-5,-6,-6,-6,-6]) 2 == -5
    print $ (kthMaxMin [1,2,3,4,-5,6,7,-2,-1,0]) 2 == -2
    -- print $ nub [ x | x <- [-1,-5,-6,-6,-6,-6], x < 0]
    -- print $ reverse $ sort $ nub $ filter (< 0) [1,2,3,4,-5,6,7,-2,-1,0]

kthMaxMin :: [Int] -> (Int -> Int)
kthMaxMin xs = (\ k -> if length (getSortedLst' xs) < k
                        then error "No such number"
                        else (getSortedLst' xs)!!(k-1))
 where
    getSortedLst = reverse $ sort $ nub $ filter (< 0) xs

-- functional level
getSortedLst' = reverse . sort . nub . filter (< 0)