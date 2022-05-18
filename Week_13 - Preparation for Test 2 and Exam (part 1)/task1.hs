main :: IO()
main = do
    print $ containsWord t1 "acd" == True
    print $ containsWord t1 "cd" == True
    print $ containsWord t1 "af" == False
    print $ containsWord t1 "ac" == False
    print $ containsWord t1 "acdh" == False
    print $ containsWord t1 "b" == False
    print $ containsWord t1 "e" == True
    print $ containsWord t2 "ab" == True
    print $ containsWord t2 "ad" == False
    print $ containsWord t3 "bdh" == True
    print $ containsWord t3 "bdi" == True
    print $ containsWord t3 "ac" == False

data BTree a = Nil | Node a (BTree a) (BTree a) 

t1 :: BTree Char
t1 = Node 'a' (Node 'c' (Node 'f' Nil Nil) (Node 'd' Nil Nil)) (Node 'b' Nil (Node 'e' Nil Nil))

t2 :: BTree Char
t2 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'b' Nil Nil)

t3 :: BTree Char
t3 = Node 'a' (Node 'b' (Node 'd' (Node 'h' Nil Nil) (Node 'i' Nil Nil)) (Node 'e' Nil Nil)) (Node 'c' (Node 'f' Nil Nil) (Node 'g' Nil Nil))

-- Solution 1
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

-- Solution 2
containsWord' :: (Eq a) => BTree a -> [a] -> Bool
containsWord' Nil [] = True
containsWord' Nil (x:xs) = False
containsWord' (Node value left right) [] = False
containsWord' (Node value Nil Nil) [x] = value == x
containsWord' (Node value left right) (x:xs)
 | value == x = helper left xs || helper right xs
 | otherwise = containsWord left (x:xs) || containsWord right (x:xs)
 where
     helper (Node value Nil Nil) [x] = x == value
     helper (Node value left right) (x:xs) = value == x && (helper left xs || helper right xs)
     helper _ _ = False

-- Solution 3
containsWord'' :: (Eq a) => BTree a -> [a] -> Bool
containsWord'' Nil _ = False
containsWord'' _ [] = False
containsWord'' (Node c Nil Nil) [x] = c == x
containsWord'' (Node value left right) w@(x:xs)
 | value == x = helper left xs || helper right xs
 | otherwise = containsWord left w || containsWord right w
 where
     helper (Node value Nil Nil) [x] = value == x
     helper (Node value left right) (x:xs) = value == x && (helper left xs || helper right xs)
     helper _ _ = False
