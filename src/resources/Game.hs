{-# LANGUAGE OverloadedStrings #-}

module Resources.Game (gameResources) where

import Web.Scotty                (ScottyM)
import Web.Scotty.Resource.Trans

import Handlers.Game

gameResources :: ScottyM ()
gameResources =
  resource "/games" $ do
    get listGames
    post createGame
