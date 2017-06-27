import UIKit

class MOptionReformaCrossingFoeItemRuta2:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 100
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeRuta2)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
