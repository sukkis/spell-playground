{-# OPTIONS_GHC -Wall #-}
-- simplified version of battleship guessing game

battleship :: String -> Int -> IO ()
battleship board turns = turn board "----------------" turns

-- hardcoded enemy board in this version
board :: String
board = "-x--x-x---------"

check :: Int -> String -> String -> (Bool, String)
check x board display =
  let
    i = (board !! x) == 'x'
    j = if i then replaceNth x 'x' display else display
  in
    (i,j)

mkGuess :: String -> String -> Int -> IO ()
mkGuess board display n = do
  putStrLn ((prettify display) ++ "          " ++ take n (repeat '*'))
  putStrLn "Enter your guess of ship position (integer)"
  inputX <- getLine
  let x = read inputX :: Int
  let (correct, display') = check x board display
  let n' = if correct then n else n-1
  turn board display' n'

turn :: String -> String -> Int -> IO ()
turn board display n
  | n == 0 && (board /= display)   =  putStrLn "You are out of turns. You lost."
  | (board == display)   =  putStrLn "You destroyed all enemy ships! You win!"
  | otherwise                      =  mkGuess board display n

replaceNth :: Int -> Char -> String -> String
replaceNth _ _ [] = []
replaceNth n newVal (x:xs)
  | n == 0 = newVal:xs
  | otherwise = x:replaceNth (n-1) newVal xs

prettify :: String -> String
prettify display =
  unlines
    [
      "*" ++ (take 4 display) ++ "*",
      "*" ++ take 4 (snd (splitAt 4 display)) ++ "*",
      "*" ++ take 4 (snd (splitAt 8 display)) ++ "*",
      "*" ++ snd (splitAt 12 display) ++ "*"
    ]

