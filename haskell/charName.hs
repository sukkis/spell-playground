charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Berta"
charName 'c' = "Cecilia"
charName char = if char `elem` ['d'..'z']
             then "Unknown character"
             else "what an earth are you writing?"
