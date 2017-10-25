{-# OPTIONS_GHC -Wall #-}
import Data.Char

-- Caesar encoding/decoding script

-- Applies shift to whole strings
encode :: Int -> String -> String
encode n sentence = map (shift n) sentence

-- Shifts by n characters c
shift :: Int -> Char -> Char
shift n c
        | c `elem` ['a'..'z']  = intToChar ((charToInt c + n) `mod` 26)
        | c == ' '         = ' '
        | otherwise        = ' ' 

-- Character to int value [0..25]
charToInt :: Char -> Int
charToInt c = (ord c) - 97

-- Int value [0.25] to character
intToChar :: Int -> Char
intToChar n = chr (n+97)

