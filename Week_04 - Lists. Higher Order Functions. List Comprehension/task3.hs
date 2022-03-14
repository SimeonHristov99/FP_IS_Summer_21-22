main :: IO()
main = do
    print $ getClosedInteval 1 9 == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print $ getClosedInteval 9 1 == [1, 2, 3, 4, 5, 6, 7, 8, 9] 

getClosedInteval :: Int -> Int -> [Int]
getClosedInteval x y = [min x y .. max x y]