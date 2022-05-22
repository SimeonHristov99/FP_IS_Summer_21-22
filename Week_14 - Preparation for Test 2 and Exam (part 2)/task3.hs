main :: IO()
main = do
    print $ isPrimeDictionary t1 vocabulary == False
    print $ isPrimeDictionary t2 vocabulary == False
    print $ isPrimeDictionary t3 vocabulary == True

type Vocabulary = [String]

data BTree = Nil | Node Char BTree BTree
 deriving (Show)
 
vocabulary :: Vocabulary
vocabulary = ["the", "a", "Some", "swimming", "liStS", "lisp"]

t1 :: BTree
t1 = Node 'a' (Node 't' (Node 'l' (Node 't' Nil Nil) (Node 'h' Nil Nil)) (Node 'i' (Node 'e' Nil Nil) (Node 'l' Nil Nil))) (Node 'h' (Node 's' (Node 'i' Nil Nil) (Node 'S' Nil Nil)) (Node 'a' (Node 't' Nil Nil) (Node 'S' Nil Nil)))

t2 :: BTree
t2 = Node 'a' (Node 't' (Node 'l' (Node 't' Nil Nil) (Node 'h' Nil Nil)) (Node 'i' (Node 'e' Nil Nil) (Node 'l' Nil Nil))) (Node 'h' (Node 's' (Node 'i' Nil Nil) (Node 's' Nil Nil)) (Node 'p' (Node 'p' Nil Nil) (Node 'S' Nil Nil)))

t3 :: BTree
t3 = Node 'a' (Node 't' (Node 'l' Nil Nil) (Node 'i' Nil Nil)) (Node 'h' (Node 's' Nil Nil) (Node 'p' Nil Nil))
