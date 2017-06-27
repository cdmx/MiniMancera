import UIKit

class MOptionReformaCrossingFoeItemTaxiPink:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 40
    private weak var typeTexture:MGameTexture!
    
    required init(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        typeTexture = model.textures.foeTaxiPink
        super.init(model:model, lane:lane)
    }
    
    override weak var texture:MGameTexture!
    {
        get
        {
            return typeTexture
        }
    }
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
