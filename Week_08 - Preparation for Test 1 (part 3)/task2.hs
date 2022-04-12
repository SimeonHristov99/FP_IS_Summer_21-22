main :: IO()
main = do
    -- print $ 15 * 21
    -- print $ sum $ [1 .. 14] ++ [16 .. 20] ++ [22 .. 26]
    print $ removeNb 26
    print $ removeNb 100
    print $ removeNb 101

removeNb :: Int -> [(Int, Int)]
removeNb n = [ (x, y) | x <- [1 .. n], y <- [1 .. n],
                x /= y && x * y == sum [1 .. n] - x - y]