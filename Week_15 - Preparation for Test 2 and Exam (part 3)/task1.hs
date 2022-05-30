import Data.Char

main :: IO()
main = do
    print $ squareDigits 9119 == 811181
    print $ squareDigits (-9119) == -811181
