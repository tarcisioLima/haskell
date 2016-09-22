module Estudos where

import Data.Monoid

-- Pessoa :: String -> Int -> Pessoa
data Pessoa = Pessoa String Int deriving Show

-- func (Pessoa "eu" 19) = 19, sem record sintaxe
func :: Pessoa -> Int
func (Pessoa _ x) = x

-- Bolsa :: String -> Double -> Pessoa -> Bolsa


bolsa :: Bolsa -> Bolsa
-- bolsa (Bolsa "prada" 999.99 (Pessoa "Eu" 19)) = 
-- Bolsa {marca = "prada", preco = 999.99, dono = Pessoa "Eu" 19}
bolsa (Bolsa marca preco (Pessoa nome idade)) =  (Bolsa marca preco (Pessoa nome idade))

data Forma = Retangulo {l1::Int, l2::Int, l3::Int, l4::Int }
             | Triangulo {l1::Int, l2::Int, l3::Int} deriving (Show)

-- func2 (Retangulo 1 2 3 4)
-- {l1 = 1, l2 = 2, l3 = 3}
func2 :: Forma -> Forma 
func2 (Retangulo x y z a) = (Triangulo x y z) 
func2 (Triangulo x y z) = (Retangulo x y z 0)

-- o value constructor é uma função então posso joga-lo num map ou filter 

data Bolsa = Bolsa {marca::String, preco::Double, dono::Pessoa} deriving Show
precoBolsa :: Bolsa -> Double
-- precoBolsa (Bolsa m p (Pessoa nome idade)) = p + 2.0
precoBolsa (Bolsa m p pessoa) = p + 2.0

lista = [(Bolsa "prada" x (Pessoa "Eu" 19)) | x <- [1..7]]
{-

    -- 1 opção
    precoBolsa (Bolsa m p pessoa) = p + 2.0
    -- 2 opção
    precoBolsa (Bolsa _ p _) = p + 2.0
    -- 3 opção
    precoBolsa (Bolsa{ preco =  }) = p + 2.0

-}


-- map teste [1..10]
-- map (\x -> Teste(x*x)) [1..10]
data Teste = Teste Int deriving Show
teste :: Int -> Teste
teste x = Teste(x + 4)
-- http://lpaste.net/ pra fazer as colagem
-- http://lpaste.net/194177


-- LER: http://haskell.tailorfontela.com.br/making-our-own-types-and-typeclasses#derived-instances
-- LER: http://haskell.tailorfontela.com.br/functors-applicative-functors-and-monoids#monoids

--  Monoids
-- ProdVazio <> = mappend ProdVazio ProdVazio = ProdVazio


data TipoProduto = Informatica | Livro | Total deriving Show
data Produto = Produto {valor::Double, tp::TipoProduto} | ProdVazio deriving Show

descontoL :: Produto -> Produto
descontoL (Produto v1 Livro) = (Produto (v1 * 0.5) Livro)
descontoL (Produto v1 tipo) = (Produto v1 tipo)

instance Monoid Produto where
 mempty = ProdVazio
 mappend ProdVazio ProdVazio = ProdVazio
 mappend ProdVazio algo      = algo
 mappend algo ProdVazio      = algo
 mappend (Produto v1 _) (Produto v2 _) = (Produto (v1 + v2) Total)


