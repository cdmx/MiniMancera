import UIKit

class MOptionWhistlesVsZombiesWhistleTypePink:MOptionWhistlesVsZombiesWhistleType
{
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        let whistle:MOptionWhistlesVsZombiesWhistlePink = MOptionWhistlesVsZombiesWhistlePink()
        
        super.init(whistle:whistle, textures:textures)
    }
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistlePinkGame
        }
    }
    
    override var barrelLength:CGFloat
    {
        get
        {
            return kBarrelLength
        }
    }
}
