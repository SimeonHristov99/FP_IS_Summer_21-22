main :: IO()
main = do
    print $ rf (Song "Mozart""The Marriage of Figaro Overture" 270) == "Summertime"
    print $ rf (Song "Gershwin""Summertime" 300) == "Rhapsody in Blue"
    print $ rf (Song "Gershwin""Rhapsody in Blue" 1100) == "Rhapsody in Blue"

rf = recommender (Playlist songs)

songs = [
    (Song "Mozart""The Marriage of Figaro Overture" 270),
    (Song "Gershwin""Summertime" 300),
    (Song "Queen""Bohemian Rhapsody" 355),
    (Song "Gershwin""Rhapsody in Blue" 1100)]

type AuthorName = String
type SongName = String
type SongLength = Int

data Song = Song AuthorName SongName SongLength
 deriving (Eq)

data Playlist = Playlist [Song]

recommender :: Playlist -> (Song -> SongName)
recommender (Playlist ss) = (\ p@(Song currentAuthor currentName currentDuration) -> 
    let option1 = [ name | (Song author name duration) <- ss, author == currentAuthor, duration > currentDuration]
                 in if not (null option1) then (head option1)
                    else if (null $ tail $ dropWhile (/= p) ss) then currentName else head [name | (Song _ name dur) <- ss, dur > currentDuration])
