main :: IO()
main = do
    print $ constructMaxBTree [3, 2, 1, 6, 0, 5] == t


data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

t :: BTree Int
t = Node 6 (Node 3 Nil (Node 2 Nil (Node 1 Nil Nil))) (Node 5 (Node 0 Nil Nil) Nil)

constructMaxBTree :: (Ord a) => [a] -> BTree a
constructMaxBTree [] = Nil
constructMaxBTree xs = Node m (constructMaxBTree $ takeWhile (/= m) xs)
                                (constructMaxBTree $ tail $ dropWhile (/= m) xs)
 where
     m = maximum xs