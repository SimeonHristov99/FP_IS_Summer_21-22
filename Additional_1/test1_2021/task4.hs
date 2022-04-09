import Data.List

main :: IO()
main = do
    print $ scoreHand ["A"] == 11
    print $ scoreHand ["A","J"] == 21
    print $ scoreHand ["5","3","7"] == 15
    print $ scoreHand ["5","4","3","2","A","K"] == 25
    print $ scoreHand ["2","3"] == 5
    print $ scoreHand ["4","5","6"] == 15
    print $ scoreHand ["7","7","8"] == 22
    print $ scoreHand ["K","J","Q"] == 30
    print $ scoreHand ["A","3"] == 14
    print $ scoreHand ["A","A"] == 12
    print $ scoreHand ["A", "10", "A"] == 12
    print $ scoreHand ["A","2","A","9","9"] == 22

helper card
 | elem card ["J", "Q", "K"] = 10
 | otherwise = read card

score currentSum [] = currentSum
score currentSum aces
 | currentSum + 11 * (length aces) > 21 = score (currentSum + 1) (tail aces)
 | otherwise = score (currentSum + 11 * (length aces)) []

scoreHand :: [String] -> Int
scoreHand xs = let parts = partition (/= "A") xs in
        score (sum $ map helper $ fst parts) (snd parts)