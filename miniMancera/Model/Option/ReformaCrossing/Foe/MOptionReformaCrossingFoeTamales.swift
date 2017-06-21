import UIKit

class VOptionReformaCrossingFoeTamales:VOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 30
    private let kMinSpeed:CGFloat = -40
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
    
    override var minSpeed:CGFloat
    {
        get
        {
            return kMinSpeed
        }
    }
    
    required init?(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing)
    {
        super.init(
            lane:lane,
            controller:controller,
            image:#imageLiteral(resourceName: "assetReformaCrossingTamales"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
