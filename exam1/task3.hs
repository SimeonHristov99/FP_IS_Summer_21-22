import Data.List

main :: IO()
main = do
    print $ maxChain [(3, 4), (5, 6), (7, 8)] == 3
    print $ maxChain [(9, 14), (3, 5), (4, 7)] == 2

maxChain :: [(Int, Int)] -> Int
maxChain = maximum . map ((+1) . chainLen) . permutations
 where
     chainLen xs = length $ takeWhile (\ ((_, e), (s, _)) -> e < s) $ zip xs $ tail xs