permutations :: Eq a => [a] -> [[a]]
permutations [] = []
permutations [x] = [[x]]
permutations (x:xs) = concat (map (interleave x) (permutations xs))

interleave :: a -> [a] -> [[a]]
interleave x xs = [ take n xs ++ [x] ++ drop n xs | n <- [0..length xs]]
