main :: IO()
main = do
    print $ highestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Bulgaria"

type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int

data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]

highestCapital :: [Country] -> Capital
highestCapital cs = fst $ foldr1 (\ c1@(n1, el1) c2@(n2, el2) -> if el1 > el2 then c1 else c2) [ (name, el) | (Country name cap cities) <- cs, (City capN el _) <- cities, capN == cap ]