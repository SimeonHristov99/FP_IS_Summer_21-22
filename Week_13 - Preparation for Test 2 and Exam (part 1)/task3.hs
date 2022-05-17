import Data.List

main :: IO()
main = do
    print $ allContain' [t1, t2] == ["acd","cd","d"]
    print $ allContain' [t1, t2, t3] == []
    print $ allContain' [t3, t4] == ["g"]

    print $ allContain [t1, t2] == ["acd","cd","d"]
    print $ allContain [t1, t2, t3] == []
    print $ allContain [t3, t4] == ["g"]

data BTree a = Nil | Node a (BTree a) (BTree a) 

t1 :: BTree Char
t1 = Node 'a' (Node 'c' (Node 'f' Nil Nil) (Node 'd' Nil Nil)) (Node 'b' Nil (Node 'e' Nil Nil))

t2 :: BTree Char
t2 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'b' Nil Nil)

t3 :: BTree Char
t3 = Node 'a' (Node 'b' (Node 'd' (Node 'h' Nil Nil) (Node 'i' Nil Nil)) (Node 'e' Nil Nil)) (Node 'c' (Node 'f' Nil Nil) (Node 'g' Nil Nil)) 

t4 :: BTree Char
t4 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'g' Nil Nil)

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

traverseDFS Nil = []
traverseDFS (Node value left right) = traverseDFS left ++ [value] ++ traverseDFS right

genWords :: (Eq a, Ord a) => BTree a -> [[a]]
genWords t = sort $ filter (\ candidate -> containsWord t candidate) $ subsequences $ sort $ traverseDFS t

allContain' :: (Eq a, Ord a) => [BTree a] -> [[a]]
allContain' = foldl1 (\ xs ys -> intersect xs ys) . map genWords

allContain :: (Eq a, Ord a) => [BTree a] -> [[a]]
allContain = foldl1 intersect . map genWords
