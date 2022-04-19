import Data.List
main :: IO()
main = do
    print $ nodes [(1, 2), (1, 3), (2, 3), (2, 4)]-- == [1, 2, 3, 4]
    print $ nodes' [(1, 2), (1, 3), (2, 3), (2, 4)]-- == [1, 2, 3, 4]

    print $ neighbours 2 [(1, 2), (1, 3), (2, 3), (2, 4)] == [3, 4]
    print $ neighbours 4 [(1, 2), (1, 3), (2, 3), (2, 4)] == []
    
    print $ adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] == [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])]

type Node = Int
type Edge = (Node, Node)
type Graph =[Edge]

adjacencyList :: Graph -> [(Node, [Node])]
adjacencyList g = [ (x, neighbours x g) | x <- nodes g ]

neighbours :: Node -> Graph -> [Node]
neighbours n g = [x2 | (x1, x2) <- g, x1 == n]
-- neighbours n g = map snd $ filter (\ (x, y) -> x == n) g

nodes :: Graph -> [Node]
nodes g = sort $ nub $ fst vector ++ snd vector
 where 
     vector = unzip g
    
nodes' :: Graph -> [Node]
nodes' = sort . nub . concatMap (\ (x, y) -> [x, y])

