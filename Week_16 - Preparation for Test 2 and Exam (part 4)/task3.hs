main :: IO()
main = do
    print $ cook [ApplePie, ApplePie, Burger, Chicken, Chicken, ApplePie] == [Sunny, Rainy, Rainy, Sunny, Rainy]
    print $ cook [ApplePie, Burger, Chicken, Chicken, ApplePie, Burger] == [Rainy,Rainy,Sunny,Rainy,Rainy]
