import UIKit

class MOptionReformaCrossingFoePolice:MOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 70
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingPolice"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}