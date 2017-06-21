import Foundation

class MPerkFactory
{
    class func factoryPerks() -> [MPerkProtocol]
    {
        let gameReformaCrossing:MGameReformaCrossing = MGameReformaCrossing()
        let gamePollutedGarden:MGamePollutedGarden = MGamePollutedGarden()
        
        let games:[MGameProtocol] = [
            gameReformaCrossing,
            gamePollutedGarden]
        
        return games
    }
}
