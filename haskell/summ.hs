summ :: Num a => [a] -> a
summ [] = 0
summ (n:ns) = n + summ ns
