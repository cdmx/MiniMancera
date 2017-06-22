import Foundation

class MPerkFactory
{
    class func factoryPerks() -> [MPerkProtocol]
    {
        let perkReformaCrossing:MPerkReformaCrossing = MPerkReformaCrossing()
        let perkPollutedGarden:MPerkPollutedGarden = MPerkPollutedGarden()
        
        let perks:[MPerkProtocol] = [
            perkReformaCrossing,
            perkPollutedGarden]
        
        return perks
    }
}
