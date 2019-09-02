{-# OPTIONS_GHC -Wall #-}

import System.Random

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten
  | Jack | Queen | King | Ace
  deriving (Eq, Ord, Enum, Show, Read)

data Suit = Clubs | Diamonds | Hearts | Spades
  deriving (Eq, Ord, Enum, Show, Read)

data Card = Card Rank Suit
  deriving (Eq, Show, Read)

type Hand = [Card]

randomRank = randomRIO (2,14) :: IO Integer



allCards = [ (i,j) | i <- [Clubs .. Spades], j <- [Two .. Ace] ]
