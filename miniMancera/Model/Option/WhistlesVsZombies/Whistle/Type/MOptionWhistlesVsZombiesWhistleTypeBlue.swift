import UIKit

class MOptionWhistlesVsZombiesWhistleTypeBlue:MOptionWhistlesVsZombiesWhistleType
{
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        let whistle:MOptionWhistlesVsZombiesWhistleBlue = MOptionWhistlesVsZombiesWhistleBlue()
        
        super.init(whistle:whistle, textures:textures)
    }
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistleBlueGame
        }
    }
    
    override var colour:UIColor
    {
        get
        {
            return UIColor.colourSuccess
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
