import UIKit

class MOptionReformaCrossingFoeItemPolice:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 60
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foePolice)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
