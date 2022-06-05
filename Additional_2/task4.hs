main :: IO()
main = do
   print $ (getOddCompositionValue [(+1),(*2),(\x -> x - 1), (\x -> div x 2)]) 2 == 2
   print $ (getOddCompositionValue [id, (5-), (\x -> mod x 2)]) 15 == 1

getOddCompositionValue :: [(Int -> Int)] -> (Int -> Int)
getOddCompositionValue fs = (\ x -> foldr (\ f x -> f x) x [ f | (f, i) <- zip fs [1 ..], odd i ])