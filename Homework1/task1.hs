import Data.Char

main :: IO()
main = do
    print $ sumCountsIter 20 1 == 3
    print $ sumCountsIter 1 1 == 1
    print $ sumCountsIter 5123 1 == 19
    print $ sumCountsIter 1234 8 == 10
    print $ sumCountsIter 5555 5 == 10
    print $ sumCountsIter 65432 6 == 11
    print $ sumCountsIter 70000 1 == 11
    print $ sumCountsIter 123321 1 == 29

countOccurrences :: Int -> Int -> Int
countOccurrences n d
 | n < 10 = if n == d then 1 else 0
 | mod n 10 == d = 1 + countOccurrences (div n 10) d
 | otherwise = countOccurrences (div n 10) d

sumDigits :: Int -> Int
sumDigits 0 = 0
sumDigits n = mod n 10 + (sumDigits $ div n 10)

sumCountsIter :: Int -> Int -> Int
sumCountsIter x d = sumDigits $ helper 0 x
 where
     helper :: Int -> Int -> Int
     helper res 0 = res
     helper res leftover = helper (res + countOccurrences leftover d) (leftover - 1)
