import Data.List

main :: IO()
main = do
    print $ isPrimeDictionary t1 vocabulary == False
    print $ isPrimeDictionary t2 vocabulary == False
    print $ isPrimeDictionary t3 vocabulary == True

    print $ isPrimeDictionary' t1 vocabulary == False
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

isPrimeDictionary :: BTree -> Vocabulary -> Bool
isPrimeDictionary Nil _ = True
isPrimeDictionary t vs = isPrime $ sum $ map (\(k,w)-> k*length w + sum (map (length) w))$ filter(\(_,x)-> x/=[]) $ zip [0..] $ map(\xs -> filter(\v -> isInfixOf v xs) vs) $ traverseBFS t 

height :: BTree -> Int
height Nil = 0
height (Node _ left right) = 1 + max (height left) (height right)

isPrimeDictionary' :: BTree -> Vocabulary -> Bool
isPrimeDictionary' t ws = isPrime $ sum [ k + length w | k <- [0 .. height t - 1], w <- ws, isInfixOf w (getLevel t k)]

isPrime :: Int -> Bool
isPrime n = n>1 && all (\x -> n `mod` x /= 0) [2..floor $ sqrt $ fromIntegral n]         

traverseBFS :: BTree  -> [[Char]]
traverseBFS t =  takeWhile (/= []) $ map (getLevel t) [0 .. ]

getLevel ::BTree -> Int -> [Char]
getLevel Nil _ = []
getLevel (Node value left right) 0 = [value]
getLevel (Node value left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)