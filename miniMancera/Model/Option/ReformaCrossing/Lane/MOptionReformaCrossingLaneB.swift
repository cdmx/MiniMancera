import UIKit

class MOptionReformaCrossingLaneB:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 120
    private let foeTypes:[MOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeVW.self,
                    MOptionReformaCrossingFoeRuta2.self,
                    MOptionReformaCrossingFoePolice.self,
                    MOptionReformaCrossingFoeTaxiPink.self,
                    MOptionReformaCrossingFoeFierroViejo.self,
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
