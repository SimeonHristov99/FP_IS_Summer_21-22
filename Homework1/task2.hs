main :: IO()
main = do
    print $ maxRotation 56789 == 68957
    print $ maxRotation 12490 == 29140
    print $ maxRotation 0 == 0
    print $ maxRotation 12400
    print $ maxRotation 10490 -- == 29140

countDigits :: Int -> Int
countDigits n = helper n 0
 where
     helper :: Int -> Int -> Int
     helper 0 res = res
     helper leftover res = helper (div leftover 10) (res + 1)

rotateLeft :: Int -> Int -> Int -> Int
rotateLeft n 0 numDigs = let chopOne = 10^(numDigs - 1) in mod n chopOne * 10 + div n chopOne
rotateLeft n keep numDigs = let chopLeft = 10^(numDigs - keep) in div n chopLeft * chopLeft + rotateLeft (mod n chopLeft) 0 (numDigs - keep)

maxRotation :: Int -> Int
maxRotation n = let nd = countDigits n in helper (rotateLeft n 0 nd) n nd 1
 where
     helper :: Int -> Int -> Int -> Int -> Int
     helper current res maxRotations i
      | i > maxRotations = res
      | otherwise = helper (rotateLeft current i maxRotations) (max current res) maxRotations (i + 1)
