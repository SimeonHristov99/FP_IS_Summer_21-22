main :: IO()
main = do
    print $ (myPolynomial (\x -> x - 2) []) 5 == 0

myPolynomial :: (Num a, Enum a) => (a -> a) -> [a] -> (a -> a)
myPolynomial f ys = (\ x -> sum [i * f (y * x) | (y, i) <- zip ys [1 ..]])