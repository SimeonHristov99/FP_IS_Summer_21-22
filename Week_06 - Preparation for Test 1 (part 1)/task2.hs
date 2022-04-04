main :: IO()
main = do
    print $ dominates (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominates (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True

    print $ dominatesFold (\x -> x + 1) (\x -> x + 2) [1, 2, 3, 4, 5] == False
    print $ dominatesFold (\x -> x * 3) (\x -> x + 2) [1, 2, 3, 4, 5] == True

dominatesFold :: (Ord a) => (a -> a) -> (a -> a) -> [a] -> Bool
dominatesFold f g xs = foldl (\ acc x -> acc && f x >= g x) True xs

dominates :: (Ord a) => (a -> a) -> (a -> a) -> [a] -> Bool
dominates f g = all (\ x -> f x >= g x)