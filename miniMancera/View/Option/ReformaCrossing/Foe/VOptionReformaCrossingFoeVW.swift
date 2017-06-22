import UIKit

class VOptionReformaCrossingFoeVW:VOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 30
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}