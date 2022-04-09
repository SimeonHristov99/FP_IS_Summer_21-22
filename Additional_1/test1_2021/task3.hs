import Data.Char

main :: IO()
main = do
    print $ persistence 39  == (3,[27,14,4])      --3*9=27, 2*7=14, 1*4=4
    print $ persistence 999 == (4,[729,126,12,2]) --9*9*9=729, 7*2*9=126,  
    print $ persistence 126 == (2,[12,2])         --1*2*6=12, 1*2=2
    print $ persistence 4   == (1,[4])
    -- print $ prodDigits 15

prodDigits :: Int -> Int
prodDigits n = helper 1 n
 where
     helper :: Int -> Int -> Int
     helper result leftover
      | leftover < 10 = result * leftover
      | otherwise = helper (result * mod leftover 10) (div leftover 10)

persistence :: Int -> (Int, [Int])
persistence n = (length $ ys n, ys n)
 where
     ys :: Int -> [Int]
     ys leftover
      | prodDigits leftover < 10 = [prodDigits leftover]
      | otherwise = (prodDigits leftover) : ys (prodDigits leftover)



-- prodDigits = product . map digitToInt . show