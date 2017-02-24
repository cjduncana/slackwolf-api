{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Models.Game (Game) where

import Data.Aeson
import Data.Text       (toLower, unpack)
import Data.Time.Clock (UTCTime)
import Data.UUID       (UUID, fromText, toText)
import GHC.Generics    (Generic)

data Game =
  Game
    { id        :: UUID
    , status    :: GameStatus
    , startTime :: Maybe UTCTime
    , endTime   :: Maybe UTCTime
    } deriving (Generic)

instance FromJSON Game where
  parseJSON (Object o) =
    Game
    <$> o .: "id"
    <*> o .: "status"
    <*> o .:? "startTime"
    <*> o .:? "endTime"

instance ToJSON Game

data GameStatus
  = Open
  | Active
  | Closed
  deriving (Generic)

instance FromJSON GameStatus where
  parseJSON =
    withText "game status" $ \status ->
      case unpack $ toLower status of
        "open"   -> return Open
        "active" -> return Active
        "closed" -> return Closed

instance ToJSON GameStatus

instance FromJSON UUID where
  parseJSON =
    withText "uuid" $ \u ->
      case fromText u of
        Just uuid -> return uuid

instance ToJSON UUID where
  toJSON uuid = String (toText uuid)
