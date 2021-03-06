import UIKit

class MOptionReformaCrossingFoeItemTamales:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 30
    private let kMinSpeed:CGFloat = -40
    private weak var typeTexture:MGameTexture!
    
    required init(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        typeTexture = model.textures.foeTamales
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
    
    override var minSpeed:CGFloat
    {
        get
        {
            return kMinSpeed
        }
    }
}
