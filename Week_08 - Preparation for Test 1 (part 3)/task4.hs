main :: IO()
main = do
    print $ factorize 152 == [2, 2, 2,19]
    print $ factorize 123 == [3, 41]
    print $ factorize 13 == [13]
    -- print $ factorize 152954 -- == [13]

factorize :: Int -> [Int]
factorize n = helper n 2
 where
     helper :: Int -> Int -> [Int]
     helper 1 _ = []
     helper leftover d
      | mod leftover d == 0 = d : helper (div leftover d) d
      | otherwise = helper leftover (d + 1)