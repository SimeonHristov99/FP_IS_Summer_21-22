main :: IO()
main = do
    print $ specialSum 1 100 == 195 -- 61, 65, 69

    -- print $ elem '6' $ show 123

specialSum a b = sum [ x | x <- [a .. b], mod (x - 1) 4 == 0 && (elem '6' $ show x)]