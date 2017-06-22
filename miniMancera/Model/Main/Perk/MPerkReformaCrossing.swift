import Foundation

class MPerkReformaCrossing:MPerkFreeProtocol
{
    private let kGameId:String = "iturbide.miniMancera.reformaCrossing"
    
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
            return MHomeOptionsReformaCrossing.self
        }
    }
}
