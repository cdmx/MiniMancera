import UIKit

class MOptionReformaCrossingFoeItemFierroViejo:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 20
    
    required init?(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        super.init(lane:lane, texture:model.textures.foeFierroViejo)
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
