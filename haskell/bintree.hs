data Tree = Leaf
    | Node Int Tree Tree
    deriving Show

treeDepth :: Tree  -> Int
treeDepth Leaf = 0
treeDepth (Node _ leftSubTree rightSubTree) =
  1 + max (treeDepth leftSubTree) (treeDepth rightSubTree)

treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node x leftSubTree rightSubTree) = x + (treeSum leftSubTree) + (treeSum rightSubTree)

isSortedTree :: Tree -> Int -> Int -> Bool
isSortedTree Leaf _ _ = True
isSortedTree (Node x leftSubtree rightSubtree) minVal maxVal =
    let leftSorted   = isSortedTree leftSubtree minVal x
        rightSorted = isSortedTree rightSubtree x maxVal
    in x >= minVal && x< maxVal && leftSorted && rightSorted

addNewMax :: Tree -> Tree
-- add a new max element to tree
addNewMax Leaf             = Node 0 Leaf Leaf  -- input tree with no nodes
addNewMax (Node x t1 Leaf) = Node x t1 (Node (x+1) Leaf Leaf)  -- this is the rightmost Node
addNewMax (Node x t1 t2)   = Node x t1 (addNewMax t2) -- intermediate node, go down right subtree


-- Can you write functions to insert a value into a Tree in order, or to convert from a Tree into a list?

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

