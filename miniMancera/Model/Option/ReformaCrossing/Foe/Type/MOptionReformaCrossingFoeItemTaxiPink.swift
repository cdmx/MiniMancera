import UIKit

class MOptionReformaCrossingFoeItemTaxiPink:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 40
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeTaxiPink)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
