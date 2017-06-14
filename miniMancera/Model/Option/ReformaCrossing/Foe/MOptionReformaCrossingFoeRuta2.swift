import UIKit

class MOptionReformaCrossingFoeRuta2:MOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 100
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingRuta2"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
