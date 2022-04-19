main :: IO()
main = do
    print $ myImages (\x -> x * x) (2+) [Point2D 2 2, Point2D 1 2, Point2D 3 7] == [Point2D 2 2, Point2D 3 7]

data Point2D a = Point2D a a
 deriving (Eq)

myImages :: (Eq a) => (a -> a) -> (a -> a) -> [Point2D a] -> [Point2D a]
myImages f g = filter (\ (Point2D x y) -> f x == g y)
-- myImages f g ps = [ p | p@(Point2D x y) <- ps, f x == g y ]


