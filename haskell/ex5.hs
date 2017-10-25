-- List comprehensions

sumElementsSquared :: Integer -> Integer
sumElementsSquared n = sum [x^2 | x <- [1..n]]

-- Print coordinate grid using comprehensions, x <= m, y <= n
grid :: Int -> Int -> [(Int,Int)]
grid m n = [(x,y) | x <- [0..m], y <- [0..n]]

-- Make n copies of a thing in a list
myReplicate :: Int -> a -> [a]
myReplicate n a = [a | _ <- [1..n]] 

-- Pythagoras triangles with right angles, x^2 + y^2 = z^2
pythagoras :: Int -> [(Int,Int,Int)]
pythagoras n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- Lists "perfect" numbers
perfects :: Int -> [Int]
perfects n = [ x | x <- [1..n], sum (factors x) == 2 * x ]

-- Breaks number to its factors
factors :: Int -> [Int]
factors n = [ x | x <- [1..n], n `mod` x == 0]

-- Scalar product - multiply corresponding members from two lists and sum the products together
scalarproduct :: [Integer] -> [Integer] -> Integer 
scalarproduct xs ys = sum [ x * y | (x,y) <- zip xs ys]
