import UIKit

class MOptionReformaCrossingFoeCyclerFemale:MOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 10
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingCyclerFemale"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
