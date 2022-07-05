import Data.List

main :: IO()
main = do
    print $ toBST t1 == t1Result
    print $ toBST t2 == t2Result
    print $ toBST t3 == t3Result

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show, Eq)

t1 :: (Num a) => BTree a
t1 = Node 2 (Node 5 Nil Nil) (Node 7 (Node 1 Nil Nil) (Node 8 Nil Nil))

t1Result :: (Num a) => BTree a
t1Result = Node 2 (Node 1 Nil Nil) (Node 7 (Node 5 Nil Nil) (Node 8 Nil Nil))

t2 :: (Num a) => BTree a
t2 = Node 0 (Node 1 Nil Nil) Nil

t2Result :: (Num a) => BTree a
t2Result = Node 1 (Node 0 Nil Nil) Nil

t3 :: (Num a) => BTree a
t3 = Node 5 (Node 2 (Node 1 Nil Nil) (Node 8 Nil Nil)) (Node 3 (Node 7 Nil Nil) (Node 10 Nil Nil))

t3Result :: (Num a) => BTree a
t3Result = Node 5 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 8 (Node 7 Nil Nil) (Node 10 Nil Nil))

traverseDFS :: BTree a -> [a]
traverseDFS Nil = []
traverseDFS (Node value left right) = traverseDFS left ++ [value] ++ traverseDFS right

toBST :: (Ord a) => BTree a -> BTree a
toBST t@(Node value left right) = helper t (foldl max value $ traverseDFS left, foldl min value $ traverseDFS right)
 where
     helper Nil _ = Nil
     helper (Node value left right) p@(x1, x2)
      | value == x1 = Node x2 (helper left p) (helper right p)
      | value == x2 = Node x1 (helper left p) (helper right p)
      | otherwise = Node value (helper left p) (helper right p)
