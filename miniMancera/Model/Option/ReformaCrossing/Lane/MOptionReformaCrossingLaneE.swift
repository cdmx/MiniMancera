import UIKit

class MOptionReformaCrossingLaneE:MOptionReformaCrossingLaneRight
{
    private let kDeltaVertical:CGFloat = -40
    private let foeTypes:[VOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [VOptionReformaCrossingFoeMetrobus.self,
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
