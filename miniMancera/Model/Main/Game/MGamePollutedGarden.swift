import Foundation

class MGamePollutedGarden:MGamePurchaseProtocol
{
    private let kGameId:String = "iturbide.miniMancera.pollutedGarden"
    private let kPurchaseId:String = "iturbide.miniMancera.pollutedGarden"
    
    var gameId:String
    {
        get
        {
            return kGameId
        }
    }
    
    var optionsClass:MHomeOptionsProtocol.Type
    {
        get
        {
            return MHomeOptionsPollutedGarden.self
        }
    }
    
    var purchaseId:String
    {
        get
        {
            return kPurchaseId
        }
    }
}
