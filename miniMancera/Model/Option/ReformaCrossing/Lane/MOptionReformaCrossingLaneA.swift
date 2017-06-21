import UIKit

class MOptionReformaCrossingLaneA:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 160
    private let foeTypes:[VOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [VOptionReformaCrossingFoeVW.self,
                    VOptionReformaCrossingFoeRuta2.self,
                    VOptionReformaCrossingFoePolice.self,
                    VOptionReformaCrossingFoeTamales.self,
                    VOptionReformaCrossingFoeTaxiPink.self,
                    VOptionReformaCrossingFoeFierroViejo.self,
                    VOptionReformaCrossingFoeLordAudi.self,
                    VOptionReformaCrossingFoeCyclerFemale.self]
        
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
