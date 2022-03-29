import Data.List

main :: IO()
main = do
    print $ hardestSubjectFold [("John", "Maths", 5), ("Kennedy", "English", 2), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 2)] == "English"
    print $ hardestSubjectFold [("John", "Maths", 5), ("Kennedy", "English", 5), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 5)] == "Maths"

type Student = String
type Subject = String
type Note = Double
type Record = (Student, Subject, Note)

hardestSubjectFold :: [Record] -> Subject
hardestSubjectFold xs = foldl1 (\ x y -> if getAvgNs x > getAvgNs y then y else x) $ getUniqSubj xs
 where
     getAvgNs s = sum (getNs s) / (fromIntegral $ length (getNs s))
     getNs s = [ n | (_, c, n) <- xs, c == s] -- filter (\ (_, c, _) -> c == s) xs
     getUniqSubj xs = nub $ map (\ (_, s, _) -> s) xs

hardestSubject :: [Record] -> Subject
hardestSubject xs = fst $ head $ sortOn snd $ map (\ s -> (s, getAvgNs s)) $ getUniqSubj xs
 where
     getAvgNs s = sum (getNs s) / (fromIntegral $ length (getNs s))
     getNs s = [ n | (_, c, n) <- xs, c == s] -- filter (\ (_, c, _) -> c == s) xs
     getUniqSubj xs = nub $ map (\ (_, s, _) -> s) xs