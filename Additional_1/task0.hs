main :: IO()
main = do
    print $ factRec 5 == 120
    print $ factIter 5 == 120

    print $ [ x + 1 | x <- [1, 2, 3], even x] == [3]
    print $ [ show x | x <- [1, 2, 3]] == ["1","2","3"]

    print $ 'a'
    print $ "a" == ['a']

    print $ [[[1,2,3]]] -- [[[Int]]]

    print $ f [1, 2, 3] [4, 7] == 6

    print $ foldr (\ x acc -> x - acc) 0 [1, 2, 3]
                            --  1 - (2 - (3 - 0))
    print $ foldr1 (\ x y -> x - y) [1, 2, 3]
                            -- 1 - (2 - 3)
    
    print $ foldl1 (\ x y -> x - y) [1, 2, 3]
                            -- (1 - 2) - 3

    print $ 4 : [6]
    
    print $ [6] >: 4 == [6, 4]
    print $ [[6]] >: [5] >: 4 == [[6], [5, 4]] -- == [6, 4]
    -- print $ (([[6]]) >: [5]) >: 4 == [[6], [5, 4]] -- == [6, 4]
    -- print $ [[6], [5]] >: 4 == [[6], [5, 4]] -- == [6, 4]
    -- print $ [[6]] >: ([5] >: (4))
    -- print $ [[6], [5, 4]]


-- infixl 7
infixr 7 >:

(>:) :: [a] -> a -> [a]
xs >: x = xs ++ [x]

f :: [Int] -> [Int] -> Int
f (x:xs) (y:ys)
 | even x = x + y + f xs ys
 | otherwise = f xs (y:ys)
f _ _ = 0

factRec :: Int -> Int
factRec 0 = 1
factRec n = n * factRec (n - 1)

-- name := 
-- x1 .. xk := 

factIter :: Int -> Int
factIter n = helper n 1
 where
     helper :: Int -> Int -> Int
     helper 0 result = result
     helper leftover result = helper (leftover - 1) (result * leftover)


