import UIKit

class MOptionReformaCrossingLaneD:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 40
    private let foeTypes:[MOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeMetrobus.self,
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
