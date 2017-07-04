import UIKit

class MOptionWhistlesVsZombiesWhistleTypePink:MOptionWhistlesVsZombiesWhistleType
{
    private let kSpeed:TimeInterval = 10
    private let kPower:CGFloat = 10
    private let kBarrelLength:CGFloat = 20
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistlePinkGame
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
