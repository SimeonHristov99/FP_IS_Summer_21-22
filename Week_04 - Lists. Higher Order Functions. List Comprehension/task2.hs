main :: IO()
main = do
    print $ myLengthRecNonPM [] == 0
    print $ myLengthRecNonPM [1, 2, 3] == 3

    print $ myLengthRecPM [] == 0
    print $ myLengthRecPM [1, 2, 3] == 3

    print $ myLengthFunc [] == 0
    print $ myLengthFunc [1, 2, 3] == 3

myLengthFunc :: [Int] -> Int
myLengthFunc = length

myLengthRecPM :: [Int] -> Int
myLengthRecPM [] = 0
myLengthRecPM (_:xs) = 1 + myLengthRecPM xs

-- myLengthRecPM :: [Int] -> Int
-- myLengthRecPM [] = True
-- myLengthRecPM (x:xs) = False

-- [1, 2, 3]
-- myLengthRecPM (x=1:xs=[2,3]) = 1 + myLengthRecPM [2,3]

myLengthRecNonPM :: [Int] -> Int
myLengthRecNonPM xs
 | null xs = 0
 | otherwise = 1 + (myLengthRecNonPM $ tail xs)