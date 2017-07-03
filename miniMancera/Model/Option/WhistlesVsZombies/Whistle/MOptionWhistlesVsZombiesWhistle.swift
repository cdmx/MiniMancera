import Foundation

class MOptionWhistlesVsZombiesWhistle:MGameUpdate<MOptionWhistlesVsZombies>
{
    let bases:[MOptionWhistlesVsZombiesWhistleBase]
    
    override init()
    {
        bases = MOptionWhistlesVsZombiesWhistle.factoryBases()
    }
}
