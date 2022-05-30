main :: IO()
main = do
    print $ isPerfectlyBalanced t == True

data BTree a = Nil | Node a (BTree a) (BTree a)

t :: BTree Char
t = Node 'H' (Node 'a' (Node 'k' Nil Nil) (Node 'e' Nil Nil)) (Node 's' (Node 'l' Nil Nil) (Node 'l' Nil Nil))
