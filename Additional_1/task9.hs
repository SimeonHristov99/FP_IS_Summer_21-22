import Data.List

main :: IO()
main = do
    print $ closestToAverage db1 == "cheese"
    print $ closestToAverage db2 == "butter"
    
    print $ cheaperAlternative db1 == 0
    print $ cheaperAlternative db2 == 1

type Product = (String, Double)
type StoreAvailability = [Product]

db1 = [("bread",1),("milk",2.5),("lamb",10),("cheese",5),("butter",2.3)]
db2 = [("bread",1),("cheese",2.5),("bread",1),("cheese",5),("butter",2.3)]

getAvg :: StoreAvailability -> Double
getAvg db = sum costs / (fromIntegral $ length costs)
 where
     costs = map snd db -- [1, 2.5, 10,]

closestToAverage :: StoreAvailability -> String
closestToAverage db = foldl1 (\ nx ny -> if (abs $ getAvgPr nx - getAvg db) > (abs $ getAvgPr ny - getAvg db) then ny else nx) $ nub $ map fst db
 where
     getAvgPr name = sum costsForProduct / (fromIntegral $ length costsForProduct )
      where
          costsForProduct = [ c | (n, c) <- db, n == name]

cheaperAlternative :: StoreAvailability -> Int
cheaperAlternative db = sum $ map moreThanMin $ nub $ map fst db
 where
     moreThanMin :: String -> Int
     moreThanMin pName = length $ filter (/= minimum prices) prices
      where
          prices = [ cPrice | (cName, cPrice) <- db, cName == pName]
    