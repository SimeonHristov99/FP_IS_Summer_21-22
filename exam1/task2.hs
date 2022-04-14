main :: IO()
main = do
    print $ (pad [['S', ' ', 'U'],['F', 'M', 'I'],['F', ' ', 'P']]) '|' == ["|||||","|S U|","|FMI|","|F P|","|||||"]
    print $ (pad [[1, 2, 3], [4, 5, 6], [7, 8, 9]]) 0 == [[0,0,0,0,0],[0,1,2,3,0],[0,4,5,6,0],[0,7,8,9,0],[0,0,0,0,0]]
    print $ (pad [[1, 2, 3, 4], [4, 5, 6, 7], [7, 8, 9, 10]]) 99 == [[99,99,99,99,99,99],[99,1,2,3,4,99],[99,4,5,6,7,99],[99,7,8,9,10,99],[99,99,99,99,99,99]]

pad :: [[a]] -> (a -> [[a]])
pad xs = (\ n -> [getRows n] ++ map (addN n) xs ++ [getRows n])
 where
  addN n l = [n] ++ l ++ [n]
  getRows x = replicate (2 + (length $ head xs)) x
  getCols x = replicate (length $ map head xs) x
