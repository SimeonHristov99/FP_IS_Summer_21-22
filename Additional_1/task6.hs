import Data.List

main :: IO()
main = do
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 2), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 2)] == "English"
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 5), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 5)] == "Maths"

type Student = String -- име на ученик
type Subject = String -- име на предмет
type Note = Double -- оценка

-- Запис за ученик, съдържащ име на ученик, учебен предмет и
-- оценката на ученика по дадения предмет.

type Record = (Student, Subject, Note)

hardestSubject :: [Record] -> Subject
hardestSubject db = foldr1 (\ x y -> if getAvg x > getAvg y then y else x) $ nub [ n | (_, n, _) <- db]
 where
     getAvg subjName = sum grades / (fromIntegral $ length grades)
      where
          grades = [ gr | (_, n, gr) <- db, n == subjName]