import UIKit

class MOptionReformaCrossingFoeItemLordAudi:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 120
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeLordAudi)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
