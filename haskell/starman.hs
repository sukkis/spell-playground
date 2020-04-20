{-# OPTIONS_GHC -Wall #-}

-- Guessing game

import           System.Random

starman :: Int -> IO ()
starman n =do
  i  <- randomRIO (0,6)
  let word = mkSecret i wordList
  turn word ['-' | _ <- word] n

check :: String -> String -> Char -> (Bool, String)
check word display c =
  let b = c `elem` word
      s = [(if c==x then x else y) | (x,y) <- zip word display]
  in
      (b,s)

turn :: String -> String -> Int -> IO ()
turn word display n
  | n >= 0 && word == display = putStrLn "You guessed right, you won!"
  | n == 0 && word /= display = putStrLn "You are out of turns. You lost."
  | otherwise                 = mkguess word display n

mkguess :: String -> String -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ " " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'

-- select word from list
mkSecret :: Int -> [String] -> String
mkSecret randomNum wList = (wList !! randomNum)

wordList :: [String]
wordList = ["possibility", "exuberance", "vitality",
         "exercise", "preacher" , "cannibalism",
         "pardon"]

