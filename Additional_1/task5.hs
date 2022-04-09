main :: IO()
main = do
    print $ dominatesFold (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominatesFold (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True
                    -- [3, 6, 9 ] [3, 4, 5 ]

    -- print $ foldl () True xs
    print $ map f 6
    print $ map (\ x -> x + 1) [6]

f x = x + 1

dominatesFold :: (Int -> Int) -> (Int -> Int) -> [Int] -> Bool
dominatesFold f g = foldl (\ acc x -> f x >= g x) True

dominates :: (Int -> Int) -> (Int -> Int) -> [Int] -> Bool
dominates f g = all (\ x -> f x >= g x)