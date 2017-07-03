import Foundation

class MOptionWhistlesVsZombiesWhistle:MGameUpdate<MOptionWhistlesVsZombies>
{
    private let bases:[MOptionWhistlesVsZombiesWhistleBase]
    
    override init()
    {
        bases = MOptionWhistlesVsZombiesWhistle.factoryBases()
    }
}
