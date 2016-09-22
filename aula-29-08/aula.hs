module Aula4 where

-- !! pega o item da lista na posicaoinformada
-- head pega o primeiro item da lista.
-- id [1,2,3,4] faz nada.
-- tail: elimina o primeiro elemento e retorna o resto(calda da lista).
-- take 5 "Santos" pega elementos da lista.
-- drop 5 "Santos" elimina elementos da lista.

-- operador cons "n : lista"
-- ex: 5 ':' [1,2,3,4], ele empilha o valor [5,1,2,3,4] ou 1 : 2 : 3 : [] = [1,2,3]
-- o pattern maching das listas é sempre usado com o cons ":"

-- exemplo pattern maching com lista. padrão exaustivo é pq ta faltando um padrao.
teste :: [Int] -> Int

teste []     = 0
teste (_:[]) = 1
teste (_:_:[]) = 2

-- A - faça uma função que receba uma lista de Strings e devolva:
-- i) Quando tiver nenhuma, uma lista vazia de Strings
-- ii) Quando a lista tiver um elemento, seu reverso.
-- iii) Quando tiver dois elementos, o reverso da primeira
--    palavra concatenado com o reverso da segunda
-- iiii) Para 3 ou mais elementos, retorne o reverso da lista.

exA :: [String] -> [String]
exA [] = []
exA (x:[]) = [reverse x]
exA (x:y:[]) = [reverse x ++ reverse y]
exA xs = reverse xs

-- B - Crie pattern matching para as situacoes:
-- i) 6 Variaveis, ignorando o quinto elemento e o fim da lista
-- ii) Para quatro elementos, o terceiro deve ser ignorado.
-- iii) Para 8 ou mais elementos, ignorando 6 deles.

-- exB (x1 : x2 : x3 : x4 : _ : _)   
-- exB (x1 : x2 : _ : x4 : [])
-- exB (_ : _ : _ : _ : _ : _ : x7 : x8)


-- C -  Dado, [7,4,5,6,8,10] em qual pattern matching esta se encaixa?
-- i) x:y:z:w:ws   SIM
-- ii) x:xs        SIM
-- iii) y:x:_:zs   SIM
-- iv) _:[]        NAO
-- v) _:_:_:_:_:_:[] SIM
-- vi) _:_:_:_:_:_:ws SIM
-- vii) _:z:_:_:_:_:[] SIM
-- ix) _:z:_:_:_:_:_:[] NAO


somar :: [Int] -> Int
somar [] = 0
somar (x:xs) = x + somar xs

{-*
exemplo recursao
somar :: [Int] -> Int

somar [] = 0

somar (x:xs) = x + somar xs

[1,2,7,3] -> 1:2:7:3:[]

somar 1:2:7:3:[] = 1 + somar 2:7:3:[] = 1 + 12 = 13
somar 2:7:3:[] = 2 + somar 7:3:[] = 2 + 10 = 12
somar 7:3:[] = 7 + somar 3:[] = 7 + 3 = 10
somar 3:[] = 3 + somar [] = 3+0 = 3

somar [] = 0
*-}

-- fatorial 

mlt :: [Int] -> Int
mlt [] = 1
mlt (x:xs) = x * mlt xs

-- Guards (Guards): é uma sintaxe do haskell
-- para checar condições booleanas ordenadamente
-- ate encontrar uma condição verdadeira ou
-- a palavra otherwise

calcularImc :: Double -> Double -> String
calcularImc peso altura
    | w <  19   = "Abaixo do peso"
    | w <= 25.8 = "Peso normal"
    | otherwise = "Acima do peso"
    where 
        w = peso / (altura * altura)

-- Faça uma função para eleminar as vogais:
elimVogal :: String -> String
elimVogal [] = []
elimVogal (x:xs) 
    | elem x "AEIOUaeiou" = elimVogal xs
    | otherwise = x : elimVogal xs


{-
CABELO
C:ABELO
C:elimVogal "ABELO"
A:BELO
C:BELO
CB:ELO
CB:LO
CBL:O
CBL-}