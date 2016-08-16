module Aula2 where

data DiaSemana = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo | Erro deriving (Show, Enum)
                 
data DayWeek = Mon | Tue | Wen | Thu | Fri | Sat | Sun | Error deriving (Show, Enum)
-- Pattern Matching > na entrada da função
-- é possivel definir um valor padrao de entrada que se ajusta ao tipo em questão.

agenda :: DiaSemana -> String
agenda Sexta   = "Dia de maldade"
agenda Sabado  = "Dia de ressaca"
agenda Domingo = "Dia de Descanso"
agenda _       = "Dia de Faculdade"

numDia :: Int -> DiaSemana
numDia 1 = Domingo
numDia 2 = Segunda
numDia 3 = Terca
numDia 4 = Quarta
numDia 5 = Quinta
numDia 6 = Sexta
numDia 7 = Sabado
numDia _ = Erro

teste = [agenda x | x <- [Segunda .. Sabado]]


{-1) Faça a função traduzirPT que recebe
uma DayWeek e retorna DiaSemana -}
traduzirPT :: DayWeek -> DiaSemana
traduzirPT Mon = Segunda
traduzirPT Tue = Terca
traduzirPT Wen = Quarta
traduzirPT Thu = Quinta
traduzirPT Fri = Sexta
traduzirPT Sat = Sabado
traduzirPT Sun = Domingo
traduzirPT _   = Erro

{-2) Faça a função traduzirEN que recebe
uma DiaSemana e retorna DayWeek -}

traduzirEN :: DiaSemana -> DayWeek
traduzirEN Segunda = Mon
traduzirEN Terca   = Thu
traduzirEN Quarta  = Wen
traduzirEN Quinta  = Thu
traduzirEN Sexta   = Fri
traduzirEN Sabado  = Sat
traduzirEN Domingo = Sun
traduzirEN _       = Error

{-3) Em uma empresa, é necessario calcular o salário
a partir do dia da semana trabalhado.
Todo sábado a remuneração sofre um acréscimo
de 50%, todo domingo de 100% e no resto
não há alteração. Faça uma função 
remunerar :: DiaSemana -> Double -> Double
que implemente esta situação.-}

remunerar :: DiaSemana -> Double -> Double
remunerar Domingo x = x * 2
remunerar Sabado  x = x + (x/2)
remunerar _       x = x

data Cor = Azul | Branco | Preto | Verde | Vermelho deriving Show

-- Tupla é uma quantidade fixa com elementos de tipos diferentes
-- ou agrupamento  agrupmento fixo de valores. Estes
-- podem ser de tipo diferentes em cada coordenada

converter :: Cor -> (Int, Int, Int)
converter Azul     = (0,0,255)
converter Branco   = (255,255,255)
converter Preto    = (0,0,0)
converter Verde    = (0,255,0)
converter Vermelho = (255,0,0)

converter2 :: (Int, Int, Int) -> Cor
converter2 (0,0,255)     = Azul
converter2 (255,255,255) = Branco
converter2 (0,0,0)       = Preto
converter2 (0,255,0)     = Verde
converter2 (255,0,0)     = Vermelho

{-4) Faça uma função que receba uma
Tupla da forma (Int, Int, Int, Int)
e devolva uma tupla com o dobro
na primeira coordenada, o triplo na
segunda, o quadruplo na terceira
e o quintuplo na última. -}


ex04 :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
ex04 (x, y, z, a) = (x*2, y*3, z*4, a*5)