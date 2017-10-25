doubles xs = [ checkDouble (2 * a) | a <- xs]

singles xs  = [a | a <- xs]

checkDouble x = if x > 9 
                then ((x `mod` 10) + 1) 
                else x
