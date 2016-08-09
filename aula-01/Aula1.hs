module Aula1 where
         
somar :: Int -> Int -> Int
somar x y = x + y

quaseDobro :: Double -> Double
quaseDobro x = 2.1 * x

f :: Int -> Bool
f a = a >= 3

str :: String 
str = "Quase ola mundo"

str2 :: String -> String
str2 hhh = "Ola " ++ hhh

rev2 :: String -> String -> String
rev2 n s = (reverse n) ++ " " ++ (reverse s)

algo :: String -> String
algo y = reverse (reverse y)

umaLista :: [Int] 
umaLista = [0..250]

umArray :: [String]
umArray = ["Uva","Pera","Ameixa"]

f2 :: [Int] -> [Int]
f2 x = reverse x ++ [3,2,1]

--List Compreenshion
auto = [2 * x | x <- [0..200], x >= 5, x <= 190]

-- 1) Gere a lista [5,7,9,11,13,17,19,21]
-- 2) Faça uma função que recebe via parâmetro
-- uma lista de inteiros e retorne uma outra lista
-- com seus número diminuidos em 2.
-- 3) Faça uma função que recebe via parâmetro
-- uma lista de inteiros e retorne uma outra lista
-- com seus número diminuidos em 7 e em sua ordem reversa.

ex1 = [2*x + 1 | x <- [2..100], x <= 10]

ex2 :: [Integer] -> [Integer]
ex2 x = [y - 2 | y <- x] 

ex3 :: [Int] -> [Int]
ex3 x = reverse([y - 7 | y <- x])

f3 :: String -> Int
f3 x = 1 + length x

f4 :: Int -> Bool
f4 x = x >= 19


-- f4 (f3 "ola") = False
listaStr :: String
listaStr = ['A'..'z']

-- 1- gabriel e vitoria primeira equipe 2, 3, 4, 5, 6,7,8,eu,
