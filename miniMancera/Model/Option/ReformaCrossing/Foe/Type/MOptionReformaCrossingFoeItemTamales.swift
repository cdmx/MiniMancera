import UIKit

class MOptionReformaCrossingFoeItemTamales:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 30
    private let kMinSpeed:CGFloat = -40
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeTamales)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
    
    override var minSpeed:CGFloat
    {
        get
        {
            return kMinSpeed
        }
    }
}
