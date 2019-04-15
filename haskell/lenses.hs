{-# LANGUAGE TemplateHaskell #-}

import Control.Lens

data Car = Car { _color :: String, _year :: Int, _brand :: String , _wheels :: [WheelType] }
         deriving Show

data WheelType = SummerTire | WinterTire
               deriving Show

makeLenses ''Car

auto = Car "pink" 1980 "Lada" (replicate 4 SummerTire)

