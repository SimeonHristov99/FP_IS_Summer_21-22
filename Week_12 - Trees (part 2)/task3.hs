main :: IO()
main = do
    print $ getLevel t1 2 -- == False
    print $ grandchildrenIncreased' t1 == False
    print $ grandchildrenIncreased' t2 == True

data BTree = Empty | Node Int BTree BTree

t1 = Node 8 (Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)) (Node 10 (Node 9 Empty Empty) (Node 14 Empty Empty))
t2 = Node 8 (Node 3 (Node 9 Empty Empty) (Node 10 Empty Empty)) (Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty))

grandchildrenIncreased :: BTree -> Bool
grandchildrenIncreased Empty = True
grandchildrenIncreased t@(Node value l r)
 | null cs = True
 | otherwise = minimum cs > value && grandchildrenIncreased l && grandchildrenIncreased r
 where
     cs = getLevel t 2

-- Node value=8
-- l=(Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty))
-- r=(Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty))

-- getLevel (Node value=8
-- l=(Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty))
-- r=(Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty))
-- ) 2
-- => [10, 14, 9, 14]

-- 10 > 8=>
-- grandchildrenIncreased Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)


-- grandchildrenIncreased Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty)

grandchildrenIncreased' :: BTree -> Bool
grandchildrenIncreased' Empty = True
grandchildrenIncreased' (Node value l r) = null cs || minimum cs > value && grandchildrenIncreased l && grandchildrenIncreased r
 where
     cs = getLevel (Node value l r) 2

getLevel :: BTree -> Int -> [Int]
getLevel Empty _ = []
getLevel (Node value _ _) 0 = [value]
getLevel (Node _ left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)