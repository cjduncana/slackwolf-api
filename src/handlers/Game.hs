{-# LANGUAGE OverloadedStrings #-}

module Handlers.Game (createGame, listGames) where

import Web.Scotty

import Models.Game

listGames :: ActionM ()
listGames =
  text "WIP"

createGame :: ActionM ()
createGame = do
  game <- jsonData :: ActionM Game
  json game
