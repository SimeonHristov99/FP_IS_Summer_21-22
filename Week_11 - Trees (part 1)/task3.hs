main :: IO()
main = do
    print $ insert (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 Nil (Node 18 Nil Nil))) 13 == (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil)))

    print $ (numberTreeAfter == numberTreeBefore) == True

    print $ secondNumberTree == Node 10 (Node 5 (Node 3 (Node 1 Nil Nil) Nil) (Node 7 (Node 6 Nil Nil) Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil))

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

numberTreeBefore :: BTree Int
numberTreeBefore = Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 Nil (Node 18 Nil Nil))

numberTreeAfter :: BTree Int
numberTreeAfter = foldl insert Nil [10, 5, 15, 3, 7, 18]

secondNumberTree :: BTree Int
secondNumberTree = foldl insert Nil [10, 5, 15, 3, 7, 13, 18, 1, 6]

insert :: (Ord a) => BTree a -> a -> BTree a
insert Nil k = Node k Nil Nil
insert (Node value left right) k
 | k > value = Node value left (insert right k)
 | otherwise = Node value (insert left k) right
