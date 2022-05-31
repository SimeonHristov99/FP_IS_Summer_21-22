import Data.Char

main :: IO()
main = do
    print $ squareDigits 9119  == 811181
    print $ squareDigits (-9119) == -811181
    
    print $ squareDigits' 9119  == 811181
    print $ squareDigits' (-9119) == -811181
    
    print $ squareDigits'' 9119  == 811181
    print $ squareDigits'' (-9119) == -811181

squareDigits :: Int-> Int
squareDigits n = (* signum n) $ read $ concat $ map (show.(^2).digitToInt) $ show $ abs n

squareDigits' :: Int-> Int
squareDigits' n
 | n < 0 = (*(-1)) $ read $ concat $ map (show.(^2).digitToInt) $ show $ abs n
 | otherwise = read $ concat $ map (show.(^2).digitToInt) $ show $ abs n

squareDigits'' :: Int-> Int
squareDigits'' n = (* div n (abs n)) $ read $ concat $ map (show.(^2).digitToInt) $ show $ abs n
