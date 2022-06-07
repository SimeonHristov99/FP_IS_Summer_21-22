main :: IO()
main = do
    print $ cook [ApplePie, ApplePie, Burger, Chicken, Chicken, ApplePie]  == [Sunny, Rainy, Rainy, Sunny, Rainy]
    print $ cook [ApplePie, Burger, Chicken, Chicken, ApplePie, Burger] == [Rainy,Rainy,Sunny,Rainy,Rainy]
data Food = ApplePie | Burger | Chicken
 deriving (Show , Eq)
data Weather = Sunny | Rainy
 deriving (Show , Eq)
cook :: [Food]->[Weather]
-- cook []=[]
-- cook [_]=[]
-- cook(x1:x2:xs)
--  |x1==x2 = Sunny : cook (x2:xs)
--  |otherwise = Rainy: cook(x2:xs)
cook xs = map(\(x1,x2)->if x1 == x2 then Sunny else Rainy) $ zip xs $ tail xs