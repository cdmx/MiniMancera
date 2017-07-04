import UIKit

class MOptionWhistlesVsZombiesWhistleType
{
    private(set) weak var textures:MOptionWhistlesVsZombiesTextures!
    private(set) weak var textureGame:MGameTexture?
    private(set) var colour:UIColor
    private(set) var speed:TimeInterval
    private(set) var power:CGFloat
    private(set) var barrelLength:CGFloat
    private let kDefaultSpeed:TimeInterval = 1
    private let kDefaultPower:CGFloat = 1
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        self.textures = textures
        colour = UIColor.clear
        speed = kDefaultSpeed
        power = kDefaultPower
        barrelLength = 0
    }
}
