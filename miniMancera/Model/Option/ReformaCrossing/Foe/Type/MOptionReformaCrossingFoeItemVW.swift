import UIKit

class MOptionReformaCrossingFoeItemVW:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 30
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeVW)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
