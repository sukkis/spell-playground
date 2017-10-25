reverseSort :: Ord a => [a] -> [a]
reverseSort [] = []
reverseSort (x:xs) = reverseSort larger ++ [x] ++ reverseSort smaller
                     where
                       larger = [a | a <- xs, a > x]
                       smaller = [b | b <- xs, b <= x]
             
