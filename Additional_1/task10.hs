import Data.List

main :: IO()
main = do
    print $ getClosestDistance [(4, 5, 6), (2, 5, 10), (5, 2, (-10)), ((-2), 1, 45), (12, 0, 2), (6, 5, 4)] == 2.83

dist (x1, x2, x3) (y1, y2, y3) = sqrt $ (x1 - y1)**2 + (x2 - y2)**2 + (x3 - y3)**2 

roundTwoDig = (/ 100) . fromIntegral . round . (*100)

getClosestDistance :: [(Double, Double, Double)] -> Double
getClosestDistance xs = roundTwoDig $ minimum $ map (\ [x, y] -> dist x y) $ filter ((==2) . length) $ subsequences xs