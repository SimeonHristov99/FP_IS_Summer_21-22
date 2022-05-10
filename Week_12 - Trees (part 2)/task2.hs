main :: IO()
main = do
    print $ numOfNodes t == 2

data NTree a = Nil | Node a [NTree a]
 deriving (Show)

t :: NTree Int
t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]

numOfNodes :: (Eq a, Num a) => NTree a -> Int
numOfNodes Nil = 0
numOfNodes (Node value children) = length [ sum cs
                    | cs <- map (\ c -> getLevel c 1) children,
                    not (null cs) && sum cs == value]
                    + (sum $ map numOfNodes children)

getLevel :: NTree a -> Int -> [a]
getLevel Nil _ = []
getLevel (Node value _) 0 = [value]
getLevel (Node _ children) k = concatMap (\ c -> getLevel c (k - 1)) children
