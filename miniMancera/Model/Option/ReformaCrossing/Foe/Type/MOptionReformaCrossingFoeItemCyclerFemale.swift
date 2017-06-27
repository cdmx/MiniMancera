import UIKit

class MOptionReformaCrossingFoeItemCyclerFemale:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 10
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeCyclerFemale)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
