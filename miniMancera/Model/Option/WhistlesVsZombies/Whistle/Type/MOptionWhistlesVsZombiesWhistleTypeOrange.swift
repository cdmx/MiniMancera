import UIKit

class MOptionWhistlesVsZombiesWhistleTypeOrange:MOptionWhistlesVsZombiesWhistleType
{
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        let whistle:MOptionWhistlesVsZombiesWhistleOrange = MOptionWhistlesVsZombiesWhistleOrange()
        
        super.init(whistle:whistle, textures:textures)
    }
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistleOrangeGame
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
