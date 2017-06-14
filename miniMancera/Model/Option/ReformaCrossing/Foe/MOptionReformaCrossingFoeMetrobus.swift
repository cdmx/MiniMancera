import UIKit

class MOptionReformaCrossingFoeMetrobus:MOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 80
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingMetrobus"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
