import Foundation

class MPerkTamalesOaxaquenos:MPerkPurchaseProtocol
{
    private let kGameId:String = "iturbide.miniMancera.tamalesOaxaquenos"
    private let kPurchaseId:String = "iturbide.miniMancera.tamalesOaxaquenos"
    
    var gameId:String
    {
        get
        {
            return kGameId
        }
    }
    
    var optionsClass:MHomeOptions.Type
    {
        get
        {
            return MHomeOptionsTamalesOaxaquenos.self
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
