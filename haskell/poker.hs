{-# OPTIONS_GHC -Wall #-}

import System.Random

main :: IO ()
main = do 
  putStrLn "Your first card: " 
  rank <- randomRank 
  suit <- randomSuit
  print (getCard rank suit)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
  deriving (Eq, Ord, Enum, Show, Read)

data Suit = Clubs | Diamonds | Hearts | Spades
  deriving (Eq, Ord, Enum, Show, Read)

data Card = Card Rank Suit
  deriving (Eq, Show, Read)

type Hand = [Card]

randomRank :: IO Int
randomRank = randomRIO (0,12)

randomSuit :: IO Int
randomSuit = randomRIO (0,3) 

-- Gets rank and suit as integers and returns the card.
getCard :: Int -> Int -> Card
getCard r s = Card ([Two .. Ace] !! r) ([Clubs .. Spades] !! s)

fullDeck :: [(Rank, Suit)]
fullDeck = [ (j,i) | i <- [Clubs .. Spades], j <- [Two .. Ace] ]
