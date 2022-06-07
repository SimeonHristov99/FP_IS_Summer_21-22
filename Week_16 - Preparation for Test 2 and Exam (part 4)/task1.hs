main :: IO()
main = do
    print $ applyEveryKth (* 2) 3 [1..6] == [1,2,6,4,5,12]
    print $ applyEveryKth (+ 2) 4 [1..7] == [1,2,3,6,5,6,7]

applyEveryKth :: (a -> a) -> Int -> [a]-> [a]
applyEveryKth f k = zipWith (\  pos x-> if mod pos k ==0 then f x else x ) [1 ..] --     functional level
-- applyEveryKth f k xs =zipWith  (\ x pos -> if mod pos k ==0 then f x else x ) xs [1 ..]
-- applyEveryKth f k xs = [if mod pos k ==0 then f x else x |(x,pos)<-zip xs [1 .. ]]
-- applyEveryKth f k xs =map(\(x,y)->if mod y k ==0 then f x else x )$ zip xs [1 ..]