{-# OPTIONS_GHC -Wall #-}

{- Towers of Hanoi - move n discs from Peg A to Peg C, using Peg B as storage. -}

type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n peg1 peg2 peg3 = (hanoi n peg1 peg2 peg2):[] 

applyMove :: Num a => [a] -> [a] -> [a] -> (Char,Char) -> [[a]]
applyMove peg1 peg2 peg3 (a,b)
          | (a,b) == ('a','b') = [drop 1 peg1, (head peg1):peg2, peg3]
          | (a,b) == ('a','c') = [drop 1 peg1, peg2, (head peg1):peg3]
          | (a,b) == ('b','c') = [peg1, drop 1 peg2, (head peg2):peg3]
          | (a,b) == ('b','a') = [(head peg2):peg1, drop 1 peg2, peg3]
          | (a,b) == ('c','a') = [(head peg3):peg1, peg2, drop 1 peg3]
          | (a,b) == ('c','b') = [peg1, (head peg3):peg2, drop 1 peg3]
          | otherwise          = [[]]
