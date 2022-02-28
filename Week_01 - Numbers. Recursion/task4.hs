main :: IO()
main = do
    print $ fibRec 11 == 89
    print $ fibIter 11 == 89
    print $ fibIter 110 == 43566776258854844738105

    -- Be careful! The following line will crash you PC!
    -- print $ fibRec 110 == 43566776258854844738105

fibRec :: Integer -> Integer
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec (n - 1) + fibRec (n - 2)

fibIter :: Integer -> Integer
fibIter n = helper n 0 1
 where
     helper :: Integer -> Integer -> Integer -> Integer
     helper 0 n1 _ = n1
     helper 1 _ n2 = n2
     helper n n1 n2 = helper (n - 1) n2 (n1 + n2)
