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

randomRank :: IO Int
randomRank = randomRIO (0,12)

randomSuit :: IO Int 
randomSuit = randomRIO (0,3) 

fullDeck :: [Card]
fullDeck = [ Card j i | i <- [Clubs .. Spades], j <- [Two .. Ace] ]

getCard :: Int -> Int -> Card
getCard x y = Card ([Two .. Ace] !! x) ([Clubs .. Spades] !! y)

randomCard :: IO ()
randomCard = randomRank >>= \rank -> randomSuit >>= \suit -> print (getCard rank suit)

runTwice :: Monad m => m b -> m b
runTwice f = do 
  _ <- f
  f 

deleteCard :: Card -> [Card] -> [Card]
deleteCard n xs = filter (\e -> e/=n) xs  

addCard :: Card -> [Card] -> [Card]
addCard x xs = x:xs
