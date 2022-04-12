main :: IO()
main = do
    print $ (specialSum (5-) [1..10]) (> 0) == 30
    print $ (specialSum (+1) [(-5)..5]) odd == 40

specialSum :: (Int -> Int) -> [Int] -> ((Int -> Bool) -> Int)
specialSum f xs = (\ p -> sum [ x * x | x <- xs, p (f x)])
-- specialSum f xs = (\ p -> sum $ map (\ x -> x^2) $ filter p $ map f xs)
-- specialSum f xs = (\ p -> sum [ x*x | x <- xs, p x*x] -- filter p $ map (\ x -> x^2) xs)