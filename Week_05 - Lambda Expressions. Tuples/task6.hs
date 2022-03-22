main :: IO()
main = do
    print $ normalize (4, 2) == (2, 1)
    print $ normalize (8, 4) == (2, 1)
    print $ normalize (2, 4) == (1, 2)

    print $ normalizeUsingLet (4, 2) == (2, 1)
    print $ normalizeUsingLet (8, 4) == (2, 1)
    print $ normalizeUsingLet (2, 4) == (1, 2)

    print $ (\ (x, y) -> (div x (gcd x y), div y (gcd x y))) (4, 2) == (2, 1)
    print $ (\ (x, y) -> (div x (gcd x y), div y (gcd x y))) (8, 4) == (2, 1)
    print $ (\ (x, y) -> (div x (gcd x y), div y (gcd x y))) (2, 4) == (1, 2)

type Rat = (Int, Int)

normalizeUsingLet :: Rat -> Rat
normalizeUsingLet (x, y) = let d = gcd x y in (div x d, div y d)

normalize :: Rat -> Rat
normalize (x, y) = (div x d, div y d)
 where d = gcd x y