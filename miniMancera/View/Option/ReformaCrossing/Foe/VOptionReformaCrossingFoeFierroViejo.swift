import UIKit

class VOptionReformaCrossingFoeFierroViejo:VOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 20
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
    
    required init?(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing)
    {
        super.init(
            lane:lane,
            controller:controller,
            image:#imageLiteral(resourceName: "assetReformaCrossingFierroViejo"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
