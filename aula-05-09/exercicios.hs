module Exercicios where

-- a) Filtre os numeros pares de uma lista
-- LAMBDA: filter (\x -> even x) [1..10]
exA :: Int -> Bool
exA x =  mod x 2 == 0 

-- b) Filtre os ímpares de uma lista
-- LAMBDA: (\x -> odd x) [1..10]
exB :: Int -> Bool
exB x =  mod x 2 /= 0 

-- c*) Filtre os números primos de uma lista (Fazer uma funcao de checar primos)
ehDivisor :: Int -> [Int]
ehDivisor vl = [x | x <- [1..vl], vl `mod` x == 0]

exC :: Int -> Bool
exC x = length(ehDivisor x) == 2

-- d) Faça uma função que receba uma lista de inteiros e retorne
-- o dobro de todos eliminando os múltplos de 4.
-- filter (\x -> mod x 4 /= 0) $ map (\x -> x * 2) [1..10]

ehMutiplo4 :: Int -> Bool
ehMutiplo4 x = mod x 4 /= 0

exD :: [Int] -> [Int]
exD xs = filter ehMutiplo4 $ map (\x -> x * 2) xs 

--e) Faça uma função que receba uma função (String -> String)
--e uma String e retorne o reverso da String que consiste
-- na aplicação da função recebida no outro parâmetro.

reverso :: String -> String
reverso x = reverse x

exE :: (String -> String) -> String -> String 
exE r x = r x

-- f) Monte um currying da função
-- hip :: Double -> Double -> Double
-- hip x y = sqrt (x*x + y*y)

hip :: Double -> Double -> Double
hip x y = sqrt (x*x + y*y)
-- :t hip 2 

-- g) Dê um jeito de aplicar a função acima em uma lista de Doubles
-- [12.3, 23.4, 8.15, 9.0, 1.2]
    -- func :: [Double] -> Int -> [Double]
    -- func [] _ = 0
    -- func (x:xs) cont
    --     | (cont `mod` 2 == 0) = x : func xs cont + 1
    --     | otherwise = func xs cont + 1
    
  func :: [Int] -> Int -> Int
  fun [] _ = []
  func 0 [] = 0
  func (x:xs) cont
           | (cont `mod` 2 == 0) = x : func xs cont + 1
           | otherwise = func xs cont + 1
  
        
--h) Elimine todas as hipotenusas que não dê 1 de uma lista
--Dê seu jeito!)
  
