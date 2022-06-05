main :: IO()
main = do
    print $ (upperBound (*2) 100) 50 == 100

upperBound :: (Ord a) => (a -> a) -> a -> (a -> a)
upperBound f y = (\ x -> max (f x) y)