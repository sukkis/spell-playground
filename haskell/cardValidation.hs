{-# OPTIONS_GHC -Wall #-}

{-
In this section, you will implement the validation algorithm for credit cards. It follows these steps:
• Double the value of every second digit beginning from the right. That is, the last digit is unchanged; the second-to-last digit is dou- bled; the third-to-last digit is unchanged; and so on. For example, [1,3,8,6] becomes [2,3,16,6].
• Add the digits of the doubled values and the undoubled dig- its from the original number. For example, [2,3,16,6] becomes 2+3+1+6+6 = 18.
1Adapted from the first practicum assigned in the University of Utrecht functional programming course taught by Doaitse Swierstra, 2008-2009. -}

-- Validate card number
isValid :: Integral a => [a] -> Bool
isValid xs = (sumItUp xs) `mod` 10 == 0

-- Calculate check sum 
sumItUp :: (Integral a) => [a] -> a
sumItUp xs = sum (map doubleTuple (createTuples xs))  

-- Tuples used to have an index for the list element. Not sure if this is idiomatic Haskell.
createTuples :: [a] -> [(Int,a)]
createTuples xs = [1..(length xs)] `zip` (reverse xs)

-- Check list index to see that only every second gets doubled
doubleTuple :: (Integral a) => (Int, a) -> a
doubleTuple x = if (odd (fst x)) then (snd x) else (double (snd x))

double :: (Integral a) => a -> a
double  x = if (2*x < 10) then 2*x else (fixOverTen x)

-- Numbers with two digits are displayd with one digit
fixOverTen :: Integral a => a -> a
fixOverTen x = ((2*x) `mod` 10) + 1



