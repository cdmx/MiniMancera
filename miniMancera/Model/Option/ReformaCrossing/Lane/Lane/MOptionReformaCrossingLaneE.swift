import UIKit

class MOptionReformaCrossingLaneE:MOptionReformaCrossingLaneRight
{
    private let kDeltaVertical:CGFloat = -40
    private let foeTypes:[MOptionReformaCrossingFoeItem.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeItemMetrobus.self,
                    MOptionReformaCrossingFoeItemCyclerFemale.self]
        
        super.init(deltaVertical:kDeltaVertical)
    }
    
    override var possibleFoes:[MOptionReformaCrossingFoeItem.Type]
    {
        get
        {
            return foeTypes
        }
    }
}
