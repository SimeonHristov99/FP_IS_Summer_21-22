import Data.Char

main :: IO()
main = do
    print $ rev 123 == 321

    print $ isPrime 5 == True
    print $ isPrime 6 == False
    print $ isPrime 11 == True
    print $ isPrime 13 == True
    print $ isPrime 1 == False

    print $ sumDig 142500 == 12
    -- print $ sum $ map (\ x -> digitToInt x) $ show 142500
    -- print $ digitToInt '5'

    print $ sumDivs 161 == 192

sumDivs :: Int -> Int
sumDivs n = sum [ d | d <- [1 .. n], mod n d == 0]

sumDig :: Int -> Int
sumDig = sum . map digitToInt . show
-- sumDig n = sum $ map digitToInt $ show n

isPrime :: Int -> Bool
isPrime n = n > 1 && [1, n] == [ d | d <- [1 .. n], mod n d == 0]

rev :: Int -> Int
rev = read . reverse . show -- rev n = read $ reverse $ show n