module ExerciciosLista where

-- exercicio 2.1
-- Gere as listas [1,11,121,1331,14641,161051,1771561] e
-- [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]

ex2ponto1    = [11 ^ x | x <- [0..6]]
ex2ponto1pt2 = [x | x <- [1..40], x `mod` 4 /= 0] 

-- Exercício2.2
-- Gere as listas 1. ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB", "AgBB"] 
-- 2. [5,8,11,17,20,26,29,32,38,41] 3. [1.0,0.5,0.25,0.125,0.0625,0.03125] 

ex2ponto2   = ["A" ++ [x] ++ "BB" | x <- ['a'..'g']]

-- ex2pontopt2 = [x + 3 ]

ex2ponto5 :: [String] -> [String]
ex2ponto5 xs = undefined


ex2ponto6 :: [String] -> [Int]
ex2ponto6 xs = [length x | x <- xs, mod (length x) 2 /= 0]

list :: [Int] -> [Int] -> [Int]
list xs ys = [fst z + snd z | z <- zip xs ys]

sl :: [Int] -> [Int] -> [Int]
sl [] [] = []s
sl (x:xs) (y:ys) = (x + y):(sl xs ys)
