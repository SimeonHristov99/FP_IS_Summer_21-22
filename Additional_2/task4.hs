main :: IO()
main = do
   print $ (getOddCompositionValue [(+1),(*2),(\x -> x - 1), (\x -> div x 2)]) 2 == 2
   print $ (getOddCompositionValue [id, (5-), (\x -> mod x 2)]) 15 == 1

