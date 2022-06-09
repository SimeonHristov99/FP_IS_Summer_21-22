import Data.List

main :: IO()
main = do
    print $ cP [Present, Late, Present, Absent, Present, Present, Present, Absent] == False
    print $ cP [Present, Late, Present, Late, Present, Late, Present, Absent, Late, Present] == True
    print $ cP [Present, Late, Present, Late, Late, Late, Present, Present, Absent, Present] == False

cP = canPass (1, 2)

type Misses = Int
type Lates = Int
type Criterion = (Misses, Lates)

data Attendance = Absent | Late | Present deriving (Eq)
type StudentRecord = [Attendance]

canPass :: Criterion -> (StudentRecord -> Bool)
canPass (m, l) = (\ xs -> misses xs <= m && lates xs <= l)
 where
     misses = length . filter (==Absent)
     lates = maximum . map length . filter ((== Late) . head) . group