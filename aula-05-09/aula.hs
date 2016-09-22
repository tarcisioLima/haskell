module Aula5 where

{- O map recebe uma (função e um array) e aplica a função para todos os elementos do array.
a função id em haskell faz nada. -}

-- funções feitas aqui possuem um corpo
-- ou seja, possuem uma definição.

dobro :: Int -> Int
dobro x = 2 * x

mapa :: [Int] -> [Int]
mapa xs = map dobro xs

{- filter retorna a uma lista cujo as verificacoes resultem em true 

EXPRESSÃO LAMBDA: função sem corpo. representa um valor do tipo função.
EXEMPLOS: map (\x -> 3 * x) [1,2,3] ou map (\x -> x * y) 

CURRYING: Eh o ato de chamar funcao com menos parametros do que definido. O resultado
disso eh uma funcao com os parametros restantes. -}

soma3 :: Int -> Int -> Int -> Int
soma3 x y z = x + y + z

--  let f = map length 
-- f :: Foldable t => [t a] -> [Int]
-- com curryng ele retorna outra função com os parametros q faltam pra vc passar.

{-
   HIGH-ORDER FUNCTIONS: Em Haskell as funcoes
   sao tratadas como valores comuns. Ou seja,
   sao passadas via parametro ou retornadas.
   
   (.) é  uma high order function, funciona como os parenteses, recebe duas funções
   exemplo show . length "oi"
   
   Fold está relacionado a acumuladores.
   
   somar listas fodl
   foldl (\soma vi -> soma + vi) 0 [1,2,3]
   ele funciona: soma = 0, vi=1, 0+1 [2,3]
                 soma = 1, vi=2, 1+2 [3]
                 soma = 3, vi=3, 3+3 [] = 6
                 
    foldl (\mult vi -> mult * vi) 1 [1..5] isso calcula o fatorial.
    com pattern maching 
    foldl (\cont _  -> cont+1) 0 "HASKELL"
    
//concatena todos os valores quando usado foldl
func :: String-> Int -> String
func x y = x ++ show y

com foldl faça uma função q conte todas as vogais. 
-}

ehVogal :: Int -> Char -> Int
ehVogal cont str 
    | elem str "AEIOUaeiou" = cont + 1
    | otherwise = cont

-- foldl ehVogal 0 "ABACATI"

