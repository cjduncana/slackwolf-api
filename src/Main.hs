module Main where

import Web.Scotty

import Resources.Game

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 app

app :: ScottyM ()
app =
  gameResources
