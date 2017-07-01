import Foundation

class MOptionReformaCrossingFoeItemMetrobus:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 80
    private weak var typeTexture:MGameTexture!
    
    required init(model:MOptionReformaCrossing, lane:MOptionReformaCrossingLane)
    {
        typeTexture = model.textures.foeMetrobus
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
