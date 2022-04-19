main :: IO()
main = do
    -- print $ member 1 2 [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] == False
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] == True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] == False

type Node = Int
type Graph =[(Node, [Node])]

member :: Node -> Node -> Graph -> Bool
member f c g = not $ null [ cs | (n, cs) <- g, n == f, elem c cs ]
-- member f c g = elem c $ head [ cs | (n, cs) <- g, n == f ]

isPath :: Graph -> [Node] -> Bool
isPath g ns = all (\ (f, c) -> member f c g) $ zip ns (tail ns)