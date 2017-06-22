import UIKit

class MOptionReformaCrossingLaneC:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 80
    private let foeTypes:[VOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [VOptionReformaCrossingFoeVW.self,
                    VOptionReformaCrossingFoeRuta2.self,
                    VOptionReformaCrossingFoePolice.self,
                    VOptionReformaCrossingFoeTaxiPink.self,
                    VOptionReformaCrossingFoeLordAudi.self]
        
        super.init(deltaVertical:kDeltaVertical)
    }
    
    override var possibleFoes:[VOptionReformaCrossingFoe.Type]
    {
        get
        {
            return foeTypes
        }
    }
}
