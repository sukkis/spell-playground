-- Spelling book generator. Usage e.g. "speller ["apple", "banana", "orange"]"
import           Data.List

-- Main function. Creates a comma separated string.
speller :: [[Char]] -> [Char]
speller [] = []
speller xs
  | length xs == 1  =  intercalate ""  (listOfRhymes xs)
  | length xs == 2  =  intercalate ", and " (listOfRhymes xs)
  | length xs >  2  =  (intercalate ", "  (reverse $ tail $ reverse $ listOfRhymes xs))
                       ++ ", and" ++ (head $ reverse $ listOfRhymes xs)

-- Apply "rhyme" to all fruits of the list
listOfRhymes :: [[Char]] -> [[Char]]
listOfRhymes xs =[ a | a <- map (rhyme) xs]

rhyme :: [Char] -> [Char]
rhyme [] = []
rhyme w  = (head w):[] ++  " is for " ++ w
