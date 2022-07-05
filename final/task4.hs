main :: IO()
main = do
    print $ areCousins t1 2 3 == False
    print $ areCousins t2 8 4 == True

data BTree a = Nil | Node a (BTree a) (BTree a)

t1 = Node 1 (Node 2 Nil Nil) (Node 3 Nil Nil)
t2 = Node 5 (Node 3 (Node 4 Nil Nil) (Node 7 Nil Nil)) (Node 2 (Node 9 Nil Nil) (Node 8 Nil Nil))

depth :: (Eq a) => BTree a -> a -> Int
depth Nil _ = 0
depth (Node value left right) key
 | value == key = 0
 | otherwise = 1 + max (depth left key) (depth right key)

getLevel :: BTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node value _ _) 0 = [value]
getLevel (Node _ left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)

parent :: (Eq a) => BTree a -> a -> a
parent t key = head $ helper t
 where
    helper Nil = []
    helper t@(Node value left right)
     | elem key (getLevel t 1) = [value]
     | otherwise = helper left ++ helper right

areCousins :: (Eq a) => BTree a -> a -> a -> Bool
areCousins t x y = depth t x == depth t y && parent t x /= parent t y