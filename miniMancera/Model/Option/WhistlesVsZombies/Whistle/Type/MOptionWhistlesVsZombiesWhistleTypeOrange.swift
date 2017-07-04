import UIKit

class MOptionWhistlesVsZombiesWhistleTypeOrange:MOptionWhistlesVsZombiesWhistleType
{
    private let kSpeed:TimeInterval = 5
    private let kPower:CGFloat = 13
    private let kBarrelLength:CGFloat = 20
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistleOrangeGame
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
