import Data.List

main :: IO()
main = do
    print $ findJudge 2 [(1, 2)] == 2
    print $ findJudge 3 [(1, 3), (2, 3)] == 3
    print $ findJudge 3 [(1, 3), (2, 3), (3, 1)] == -1
    print $ findJudge 3 [(1, 2), (2, 3)] == -1
    print $ findJudge 4 [(1, 3), (1, 4), (2, 3), (2, 4), (4, 3)] == 3

    -- print $ nub $ map fst $ filter (\ (f, s) -> s == 3) [(1, 3), (1, 4), (2, 3), (2, 4), (4, 3)]
    -- print $ nub $ map fst $ filter (\ (f, s) -> s == 3) [(1, 3), (2, 3), (3, 1)]

findJudge :: Int -> [(Int, Int)] -> Int
findJudge n g = convert $ filter isJudge [1 .. n]
 where
     convert :: [Int] -> Int
     convert [] = -1
     convert xs = head xs

     isJudge :: Int -> Bool
     isJudge x = trustsNobody x && trustedByEvryone x

     trustsNobody :: Int -> Bool
     trustsNobody x = null [ f | (f, _) <- g, f == x ]

     trustedByEvryone :: Int -> Bool
     trustedByEvryone x = n - 1 == (length $ nub $ map fst $ filter (\ (f, s) -> s == x) g)
    --  trustedByEvryone x = [1 .. x-1] ++ [x + 1 .. n] == (sort $ nub $ map fst $ filter (\ (a, b) -> b == x) g)

-- [(1, 2), (2, 3)]

-- filter isJudge [1, 2, 3]

-- 1
-- null [ f | (f, _) <- g, f == x ]
-- [(1, 2), (2, 3)]
-- [1]

-- 2
-- null [ f | (f, _) <- g, f == x ]
-- [(1, 2), (2, 3)]
-- [2]

-- 3
-- null [ f | (f, _) <- g, f == x ]
-- [(1, 2), (2, 3)]
-- []

-- [(1, 2), (2, 3)]
-- n - 1 == (length $ nub $ map fst $ filter (\ (f, s) -> s == 3) g)
-- n - 1 == (length $ nub $ map fst $ [(2, 3)])
-- n - 1 == (length $ nub $ [2])
-- n - 1 == (length [2])
-- 2 == 1
-- False


-- 1. for 

-- [(1, 3), (2, 3)]
-- [] 3

-- [(1, 3), (2, 3), (3, 1)]
-- [3, 3, 1]

-- [(1, 3), (1, 4), (2, 3), (2, 4), (4, 3)]
-- all ==3 [3, 4, 3, 4, 3]