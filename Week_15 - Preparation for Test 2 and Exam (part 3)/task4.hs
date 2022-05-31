main :: IO()
main = do
    print $ isPerfectlyBalanced t == True

data BTree a = Nil | Node a (BTree a) (BTree a)

t :: BTree Char
t = Node 'H' (Node 'a' (Node 'k' Nil Nil) (Node 'e' Nil Nil)) (Node 's' (Node 'l' Nil Nil) (Node 'l' Nil Nil))

isPerfectlyBalanced :: BTree a -> Bool
isPerfectlyBalanced tree = 2 ^ (height tree) - 1 == size tree

height :: BTree a -> Int
height Nil = 0
height (Node _ left right) = 1 + max (height left) (height right)

size :: BTree a -> Int
size Nil = 0
size (Node _ left right) = 1 + (size left) + (size right)