import UIKit

class VOptionReformaCrossingFoeTaxiPink:VOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 40
    
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
            image:#imageLiteral(resourceName: "assetReformaCrossingTaxiPink"))
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}