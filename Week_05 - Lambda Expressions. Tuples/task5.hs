main :: IO()
main = do
    print $ divideNonPM (10, 5) == (2, 0)
    print $ divideNonPM (5, 10) == (0, 5)

    print $ dividePM (10, 5) == (2, 0) -- 10 / 5 = 2 and 10 % 5 = 0
    print $ dividePM (5, 10) == (0, 5) -- 5 / 10 = 0 and 5 % 10 = 5

    print $ (\ (x, y) -> (div x y, mod x y)) (10, 5) == (2, 0)
    print $ (\ (x, y) -> (div x y, mod x y)) (5, 10) == (0, 5)

type Point = (Int, Int)

dividePM :: Point -> Point
dividePM (x, y) = (div x y, mod x y)

divideNonPM :: Point -> Point
divideNonPM v = (div (fst v) (snd v), mod (fst v) (snd v))