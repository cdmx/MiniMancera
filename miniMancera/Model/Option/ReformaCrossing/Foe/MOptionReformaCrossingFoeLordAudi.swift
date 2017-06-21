import UIKit

class VOptionReformaCrossingFoeLordAudi:VOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 120
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingLordAudi"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
