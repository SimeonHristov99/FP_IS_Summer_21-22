main :: IO()
main = do
    print $ mapNested (*3) (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == List [Elem 3,List [Elem 6,List [Elem 9,Elem 12],Elem 15]]
    print $ mapNested (take 2 . show) (List [Elem 15, List [Elem 200, List [Elem 351.52, Elem 463.12], Elem 5]]) == List [Elem "15",List [Elem "20",List [Elem "35",Elem "46"],Elem "5."]]
    print $ mapNested (*3) (Elem 1) == Elem 3

data NestedList a = Elem a | List [NestedList a]
 deriving (Eq)

