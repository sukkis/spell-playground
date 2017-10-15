{-# OPTIONS_GHC -Wall #-}

import Data.Char

-- Card validator. Usage: give a number to validate function. 
validate :: Integer -> Bool
validate xs 
         | checkSum `mod` 10 == 0  = True
         | otherwise               = False
  where checkSum = sumDigits (toDigitsRev xs)

-- Make a list of integers from input number
toDigits :: Integer -> [Integer]
toDigits xs | xs <= 0 = []
            | otherwise = map toInteger (map (digitToInt) (show xs)) 

-- Reverse input list
toDigitsRev :: Integer -> [Integer]
toDigitsRev xs = reverse (toDigits xs)

-- Double every other
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = zipWith (*) xs (cycle [1,2])

-- Sum digits in list, taking care of double digit numbers
sumDigits :: [Integer] -> Integer
sumDigits xs = sum (map fixDoubleDigit (doubleEveryOther xs))


-- Two digit numbers are handled as separate single digits. E.g. 14 -->  1 + 4 --> 5 
fixDoubleDigit :: Integer -> Integer
fixDoubleDigit x 
           | x == 0      = 0
           | x <= 9      = x
           | x >  9      = (x `mod` 10) + 1
           | otherwise   = -1
