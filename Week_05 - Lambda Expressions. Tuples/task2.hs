main :: IO()
main = do
    print $ (difference (\x -> 2 * x)) 15.16 15.20 == 7.99999999999983e-2
    print $ (difference (\x -> 2 * x)) 8.5 8 == -1.0

difference :: (Num a) => (a -> a) -> (a -> a -> a)
difference f = (\ x y -> f y - f x)