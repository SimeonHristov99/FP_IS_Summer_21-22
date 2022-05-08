main :: IO()
main = do
    print $ numOfNodes t == 2

data NTree a = Nil | Node a [NTree a]
 deriving (Show)

t :: NTree Int
t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]
