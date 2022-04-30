main :: IO()
main = do
    print $ TwoD 5 6 == TwoD 7 8
    print $ ThreeD 5 6 7

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq)
