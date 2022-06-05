main :: IO()
main = do
    print $ (read "TwoD 5 6" :: Point Int)
    print $ TwoD 5 6 == ThreeD 5 6 5
    print $ h 5 (map (+1) [0 ..])

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Read, Eq)
-- data BTree a = Nil | Node a (BTree a) (BTree a)
-- data NTree = Nil | Node Int [NTree]

f :: (Ord a, Num a) => a -> Bool
f n = n >= 5

h :: Int -> [Int] -> Bool
h n _ = n > 6