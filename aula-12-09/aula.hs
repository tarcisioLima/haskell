module Aula06 where

import Data.Monoid
-- type classes 
-- o data constructor tem o tipo (type variable/paramiter). 

data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo 
-- Coisa é um tipo que possui um TYPE VARIABLE 
-- a possui tres values constructors
-- 1) UmaCoisa: possui um campo do tipo a
-- 2) DuasCoisas: possui dois campos do tipo a
-- 3) Nada: sem campos.

-- Polimorfismo paramétrico: a partir
--  de uma type variable A é possivel montar
-- estruturas especificas para cada a fixado.
-- Exenplo: Coisa String, Coisa Int
-- [String], [Int]...

-- data Coisa a = UmaCoisa a | DuasCoisas a a | Nada deriving Show 

-- :kind retorna quantos tipos a estrutura tem.
-- :t Nada = Coisa a <- é um fantasma pq nada foi definido.

{-
    Type Class: se assemelha a classe em orientação a objetos. 
    é uma estrutura que define o comportamento de vários tipos.
    Exemplo: Show, Ord, Eq,...
    Baseando-se no tipo Dia e usando o deriving, O haskell
    cria automaticamente a instancia Show Dia.
-}

-- Apagando o deriving Show, podemos criar uma instancia Show Dia diferente.
instance Show Dia where 
    -- show :: a -> String
    -- Como aqui dentro é o Show Dia temos
    -- show:: Dia -> String
    show Segunda = "Segunda dia - aff"
    show Terca = "Teceiro dia - aff"
    show Quarta = "Quarto dia - aff"
    show Quinta = "Quase lá0"
    show Sexta = "Dia de maldade"
    show Sabado = "Dia de estudar"
    show Domingo = "pior dia"

data Numero = Zero | Um 

instance Show Numero where
    show Zero = "0"
    show Um = "1"

instance Eq Numero where
    -- Geral (==) :: a->a->Bool
    -- Aqui dentro: (==) :: Numero -> Numero -> Bool
    Zero == Um = True 
    Zero == Zero = True
    Um == Zero = False
    Um == Um = False
    -- o eq ja contem a negação(/=).

-- data Bolsa a = Vazia | UmaCoisa a | DuasCoisas a a deriving (Show) 
-- (DuasCoisas 1 2 == DuasCoisas 1 2) = True
         --(tem q colocar eq a no inicio pra poder comparar)
         
         
-- instance (Eq a) => Eq (Bolsa a) where
--     Vazia == Vazia = True
--     (UmaCoisa x) == (UmaCoisa y) = x == y
--     (DuasCoisas x y) == (DuasCoisas z w) = (x == z && y == w) || (y == z && w == x)
--     _ == _ = False


    
{-
    Monoids: um conjunto M com uma operação binária.
    <>: M -> M -> M (mappend) é chamado de monóide se satisfizer:
    a)elemento neutro(mempty): ()
    b) associativo:
    monóid é uma typeclass do haskell.
    
-}
-- :t mappend
-- mappend :: Monoid a => a -> a -> a
-- [1,4] <> [] <> [7,8]

{-
    (Product)
-}

data Bolsa a = Nada | UmaCoisa a deriving Show
          -- garente(restringe) q  o tipo seja igual pra realizar a operacao, no caso tipo monoid e n moned
instance (Monoid a) => Monoid (Bolsa a) where
    mempty = Nada
    mappend (UmaCoisa x) (UmaCoisa y) = UmaCoisa (x <> y)
    mappend x Nada = x
    mappend Nada x = x
   
    
d0 :: (Monoid a, Ord a) => a -> Bool
d0 x = x<>x > mempty
