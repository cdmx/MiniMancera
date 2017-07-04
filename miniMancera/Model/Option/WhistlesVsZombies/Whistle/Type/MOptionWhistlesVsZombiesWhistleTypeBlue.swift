import UIKit

class MOptionWhistlesVsZombiesWhistleTypeBlue:MOptionWhistlesVsZombiesWhistleType
{
    private let kSpeed:TimeInterval = 20
    private let kPower:CGFloat = 4
    private let kBarrelLength:CGFloat = 20
    
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
    
    override var speed:TimeInterval
    {
        get
        {
            return kSpeed
        }
    }
    
    override var power:CGFloat
    {
        get
        {
            return kPower
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
