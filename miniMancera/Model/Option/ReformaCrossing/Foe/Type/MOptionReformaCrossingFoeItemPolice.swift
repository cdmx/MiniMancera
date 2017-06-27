import UIKit

class MOptionReformaCrossingFoeItemPolice:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 60
    private weak var typeTexture:MGameTexture!
    
    required init(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        typeTexture = model.textures.foePolice
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
