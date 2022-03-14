main :: IO()
main = do
    print $ getPrimesLC 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesLC 100 1 == [7,17,37,47,67,71,73,79,97]

    print $ getPrimesHOF 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesHOF 100 1 == [7,17,37,47,67,71,73,79,97]

isPrime :: Int -> Bool
isPrime n = n > 1 && [1, n] == [ d | d <- [1 .. n], mod n d == 0]

getPrimesHOF :: Int -> Int -> [Int]
getPrimesHOF x y = filter (\ d -> isPrime d && (elem '7' $ show d)) [min x y .. max x y]

getPrimesLC :: Int -> Int -> [Int]
-- getPrimesLC x y = [ d | d <- [min x y .. max x y], isPrime d && (any (=='7') $ show d)]
getPrimesLC x y = [ d | d <- [min x y .. max x y], isPrime d && (elem '7' $ show d)]

