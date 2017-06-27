import UIKit

class MOptionReformaCrossingFoeItemMetrobus:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 80
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeMetrobus)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
