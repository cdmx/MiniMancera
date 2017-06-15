import Foundation

class MGameFactory
{
    class func factoryGames() -> [MGameProtocol]
    {
        let gameReformaCrossing:MGameReformaCrossing = MGameReformaCrossing()
        let gamePollutedGarden:MGamePollutedGarden = MGamePollutedGarden()
        
        let games:[MGameProtocol] = [
            gameReformaCrossing,
            gamePollutedGarden]
        
        return games
    }
}
