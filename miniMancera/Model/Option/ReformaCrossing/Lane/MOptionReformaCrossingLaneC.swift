import UIKit

class MOptionReformaCrossingLaneC:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 80
    private let foeTypes:[MOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeVW.self,
                    MOptionReformaCrossingFoeRuta2.self,
                    MOptionReformaCrossingFoePolice.self,
                    MOptionReformaCrossingFoeTaxiPink.self,
                    MOptionReformaCrossingFoeLordAudi.self]
        
        super.init(deltaVertical:kDeltaVertical)
    }
    
    override var posibleFoes:[MOptionReformaCrossingFoe.Type]
    {
        get
        {
            return foeTypes
        }
    }
}
