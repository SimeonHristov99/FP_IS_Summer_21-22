main :: IO()
main = do
    print $ findNb 1071225 == 45
    print $ findNb 40539911473216 == 3568
    print $ findNb 135440716410000 == 4824
    print $ findNb 4183059834009 == 2022
    print $ findNb 91716553919377 == -1
    print $ findNb 24723578342962 == -1

findNb :: Integer -> Integer
findNb m = helper 1 2
 where
    helper cSum toAdd
     | cSum > m = -1
     | cSum == m = toAdd - 1
     | otherwise = helper (cSum + toAdd*toAdd*toAdd) (toAdd + 1)
