import Data.List

main :: IO()
main = do
    print $ genWords t1 == ["abe","acd","acf","be","cd","cf","d","e","f"]
    print $ genWords t2 == ["ab","acd","b","cd","d"]
    print $ genWords t3 == ["abdh","abdi","abe","acf","acg","bdh","bdi","be","cf","cg","dh","di","e","f","g","h","i"]

data BTree a = Nil | Node a (BTree a) (BTree a) 

t1 :: BTree Char
t1 = Node 'a' (Node 'c' (Node 'f' Nil Nil) (Node 'd' Nil Nil)) (Node 'b' Nil (Node 'e' Nil Nil))

t2 :: BTree Char
t2 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'b' Nil Nil)

t3 :: BTree Char
t3 = Node 'a' (Node 'b' (Node 'd' (Node 'h' Nil Nil) (Node 'i' Nil Nil)) (Node 'e' Nil Nil)) (Node 'c' (Node 'f' Nil Nil) (Node 'g' Nil Nil))

containsWord :: (Eq a) => BTree a -> [a] -> Bool
containsWord Nil [] = True
containsWord (Node value Nil Nil) [x] = value == x
containsWord (Node value left right) (x:xs)
 | value == x = helper left xs || helper right xs
 | otherwise = containsWord left (x:xs) || containsWord right (x:xs)
 where
     helper (Node value Nil Nil) [x] = x == value
     helper (Node value left right) (x:xs)
      | value == x = helper left xs || helper right xs
      | otherwise = False
     helper _ _ = False
containsWord _ _ = False

-- Solution 1
traverseDFS Nil = []
traverseDFS (Node value left right) = traverseDFS left ++ [value] ++ traverseDFS right

genWords :: (Eq a, Ord a) => BTree a -> [[a]]
genWords t = sort $ filter (\ candidate -> containsWord t candidate) $ subsequences $ sort $ traverseDFS t
-- genWords t = sort $ filter (containsWord t) $ subsequences $ sort $ traverseDFS t

-- Solution 2
genWords' :: (Eq a, Ord a) => BTree a -> [[a]]
genWords' Nil = [[]]
genWords' t@(Node value left right) = sort $ filter (containsWord t) $ nub $ concatMap tails $ map (\ x -> value : x ) (genWords' left) ++ [[value]] ++ map (value:) (genWords' right)

-- Solution 3
traverseDFS' :: BTree a -> [[a]]
traverseDFS' Nil = []
traverseDFS' (Node value Nil Nil) = [[value]]
traverseDFS' (Node value left right) = (map (value:) $ traverseDFS' left) ++ (map (value:) $ traverseDFS' right)

genWords'' :: (Ord a) => BTree a -> [[a]]
genWords'' = sort . nub . filter (not . null) . concatMap tails . traverseDFS'