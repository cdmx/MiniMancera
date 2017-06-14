import UIKit

class MOptionReformaCrossingLaneA:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 160
    private let foeTypes:[MOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeVW.self,
                    MOptionReformaCrossingFoeRuta2.self,
                    MOptionReformaCrossingFoePolice.self,
                    MOptionReformaCrossingFoeTamales.self,
                    MOptionReformaCrossingFoeTaxiPink.self,
                    MOptionReformaCrossingFoeFierroViejo.self,
                    MOptionReformaCrossingFoeLordAudi.self,
                    MOptionReformaCrossingFoeCyclerFemale.self]
        
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
