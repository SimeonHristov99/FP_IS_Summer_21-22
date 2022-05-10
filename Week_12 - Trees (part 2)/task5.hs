main :: IO()
main = do
    print $ flatten (List []) == []
    print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == [1,2,3,4,5]
    print $ flatten (Elem 1) == [1]

data NestedList = Elem Int | List [NestedList]

flatten :: NestedList -> [Int]
flatten (Elem value) = [value]
flatten (List cs) = concatMap flatten cs