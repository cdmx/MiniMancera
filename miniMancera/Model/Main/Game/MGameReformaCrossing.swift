import Foundation

class MGameReformaCrossing:MGameFreeProtocol
{
    private let kGameId:String = "iturbide.miniMancera.reformaCrossing"
    
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
            return MHomeOptionsReformaCrossing.self
        }
    }
}
