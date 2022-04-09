import Data.Char

main :: IO()
main = do
    print $ isInteresting 410 == True
    print $ isInteresting 212 == False
    print $ isInteresting 567 == False
    print $ isInteresting 70 == True 
    print $ isInteresting 5 == True 
    print $ isInteresting 4 == True

    print $ sum $ map digitToInt $ show 123 

isInteresting :: Int -> Bool
isInteresting n = mod n (sum $ map digitToInt $ show n) == 0