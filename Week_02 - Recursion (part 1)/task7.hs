main :: IO()
main = do
    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False

    print $ hasIncDigits' 1244 == True
    print $ hasIncDigits' 12443 == False
    -- print $ hasIncDigits' (-12443) == False
    -- print $ hasIncDigits' (-1) == False

hasIncDigits :: Int -> Bool
hasIncDigits n = n < 10 || mod n 10 >= mod (div n 10) 10 && hasIncDigits (div n 10)

hasIncDigits' :: Int -> Bool
hasIncDigits' n
 | n < 0 = error "n has to be non-negative"
 | n < 10 = True
 | otherwise = mod n 10 >= mod (div n 10) 10 && hasIncDigits (div n 10)

{-
1244
4 >= 4 => True
False || hasIncDigits 124
    False || hasIncDigits 12
        False || hasIncDigts 1
            True
        False || True
    False || False || True
False || False || False || True
> True

hasIncDigits 12443
False || False
> False
-}
