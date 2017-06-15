import Foundation

class MGamePollutedGarden:MGamePurchaseProtocol
{
    private let kGameId:String = "iturbide.miniMancera.reformaCrossing"
    private let kPurchaseId:String = ""
    
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
