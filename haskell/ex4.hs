halve :: [a] -> ([a],[a])
halve xs = (first xs, second xs) 

halfLength :: [a] -> Int
halfLength xs = (length xs) `div` 2 

first :: [a] -> [a]
first xs = take (halfLength xs) xs

second :: [a] -> [a]
second xs = drop (halfLength xs) xs

third :: [a] -> a
third xs = head (tail (tail xs))


third' :: [a] -> a
third' xs = thirdOfThree (take 3 xs)
thirdOfThree [_,_,z] = z

nulli :: [a] -> Bool
nulli xs = if (length xs) > 0 then False else True

safetailA :: [a] -> [a]
safetailA xs = if nulli xs then [] else tail xs

safetailB :: [a] -> [a]
safetailB xs
                | nulli xs == False = tail xs
                | otherwise = [] 

safetailC :: [a] -> [a]
safetailC [] = []
safetailC xs = tail xs

myOr  :: Bool -> Bool -> Bool
False `myOr` False = False
True  `myOr` _ = True
