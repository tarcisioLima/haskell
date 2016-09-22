module Aula07 where

-- Haskell ultilaza mt teoria das categorias em funtores e outros aspectos. CATEGORIA.
-- objetos, morfismos, composição, identidades, associatividade da composição. OBS ASSISTIR: category theory introduction.
-- Lei de associatividade: os caminhos para chegar ao resultado são equivalentes.
-- Functores é jeito de relacionar duas categorias, funtor é kind 2.
-- o funtor rotula um tipo, e faz com q essa tipo rotulado n se relaciona com outros tipo n retulados.
-- em outras palavras o não deixa o q é impuro se relacionar com puro.
-- fmap generalização do map.
import Data.Monoid

data John = John deriving Show
data Mary = Mary deriving Show

data Vampiro a = Vampiro a deriving Show

instance Functor Vampiro where
    fmap f(Vampiro pessoa) = Vampiro (f pessoa)
    
amar :: John -> Mary
amar John = Mary


-- fazer divisao
safeDiv :: Double ->  Double -> Maybe Double
safeDiv _ 0 = Nothing 
safeDiv x y = Just (x / y)

-- *Aula07> fmap (*2) (safeDiv 10 5)
-- Just 4.0

safeDiv' :: Double -> Double -> Maybe (Sum Double)
safeDiv' _ 0 = Nothing
safeDiv' x y = Just (Sum (x/y))

validar :: String -> Maybe String
validar "" = Nothing
validar x = Just x

func :: Int -> [Int]
func x = [x]

func2 :: Int -> Maybe Int
func2 x = Just x

-- fmap pega uma função de um tipo para outro e um functor aplicado em um tipo 
-- e retorna um functor aplicado ao outro tipo.


-- os funtores n se comportanm bem com a composição.
-- a moned ajuda a compor os funtores.

-- Eu e Luiz. 9:00 prova. 

-- o q apresentar: 
{-
    
-}

