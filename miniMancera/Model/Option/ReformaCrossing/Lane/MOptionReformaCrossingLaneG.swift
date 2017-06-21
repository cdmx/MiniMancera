import UIKit

class MOptionReformaCrossingLaneG:MOptionReformaCrossingLaneRight
{
    private let kDeltaVertical:CGFloat = -120
    private let foeTypes:[VOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [VOptionReformaCrossingFoeVW.self,
                    VOptionReformaCrossingFoeRuta2.self,
                    VOptionReformaCrossingFoePolice.self,
                    VOptionReformaCrossingFoeTaxiPink.self,
                    VOptionReformaCrossingFoeFierroViejo.self,
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
