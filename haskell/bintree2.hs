data Tree = Leaf
    | Node Int Tree Tree
    deriving Show

-- Sums up tree nodes' values
treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node x leftSubTree rightSubTree) = x + (treeSum leftSubTree) + (treeSum rightSubTree)

-- Gets value of a node.
getValue :: Tree -> Int
getValue Leaf         = 0
getValue (Node x _ _) = x

-- Inserts a value into a Tree, in order.
insertTreeValue :: Int -> Tree -> Tree
insertTreeValue x (Leaf) = Node x Leaf Leaf
insertTreeValue x (Node y left right)
  | getValue (Node y left right) > x  = Node x (Node y left right) Leaf
  | (getValue left) <= x              = Node y left (insertTreeValue x right)
  | (getValue left) > x               = Node y (insertTreeValue x left) right

-- Convert a tree into a list
treeToList :: Tree -> [Int]
treeToList (Leaf)              = []
treeToList (Node x Leaf Leaf)  = [x]
treeToList (Node x left right)  =
  let l =  getValue (Node x left right) : treeToList left
      r =  treeToList right
  in
      l ++ r
