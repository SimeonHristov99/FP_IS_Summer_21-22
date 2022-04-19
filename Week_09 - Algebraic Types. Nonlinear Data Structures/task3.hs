main :: IO()
main = do
    print $ Circle 6
    print $ Rectangle 5 6
    print $ Triangle 4 5 6
    print $ Cylinder 4.78 9.3
    print $ Cylinder 4 5 == Rectangle 4 5

-- type <- This is a synonym
data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq)

