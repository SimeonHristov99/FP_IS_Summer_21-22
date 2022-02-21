main :: IO()
main = do
    print $ min 5 6 == 5
    print $ minIf (-5) (-6) == (-6)
    print $ minIf 15 60 == 15
    print $ minIf 60 15 == 15
    print $ minGuard 15 60 == 15
    print $ minGuard 60 15 == 15
    print $ minBuiltIn 60 15 == 15
    
    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32

    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15  

    print $ divReal 154.451 10.01 == 15.42967032967033
    print $ quotientReal 154.21 17.17 == 9
    print $ avgWhole 5 1542 == 773.5
    print $ roundTwoDig 3.1413465345321 == 3.14
    print $ roundTwoDigButWithMagic 3.1413465345321 == 3.14 -- partial function application and composition (defining a function at functional level)

roundTwoDigButWithMagic :: Double -> Double
roundTwoDigButWithMagic = (/ 100) . fromIntegral . round . (* 100)

roundTwoDig :: Double -> Double
roundTwoDig x = (fromIntegral $ round $ x * 100) / 100

-- 3.1413465345321
-- 314
-- 3.14

avgWhole :: Int -> Int -> Double
avgWhole x y = (fromIntegral $ x + y) / 2

quotientReal :: Double -> Double -> Int
quotientReal x y = round $ x / y

divReal :: Double -> Double -> Double
divReal x y = x / y

removeLastDigit :: Int -> Int
removeLastDigit x = div x 10

divWhole :: Int -> Int -> Double
divWhole x y = fromIntegral x / fromIntegral y

quotientWhole :: Int -> Int -> Int
quotientWhole x y = div x y

lastDigit :: Int -> Int
lastDigit x = mod x 10

minIf :: Int -> Int -> Int
minIf x y = if x > y then y else x

minGuard :: Int -> Int -> Int
minGuard x y
 | x > y = y
 | otherwise = x -- x <= y

minBuiltIn :: Int -> Int -> Int
minBuiltIn x y = min x y -- minBuiltIn = min

{-
!=
/= || not (=)
TDD
void f(int a)
{

}
Cntr + Alt + N
-}