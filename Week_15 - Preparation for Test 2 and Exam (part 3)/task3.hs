main :: IO()
main = do
    print $ matching "1234" == []
    print $ matching ",[.[-],]" == [(3,5),(1,7)]
    print $ matching ",+[-.,+]" == [(2,7)]
    print $ matching "[][]" == [(0,1),(2,3)]
