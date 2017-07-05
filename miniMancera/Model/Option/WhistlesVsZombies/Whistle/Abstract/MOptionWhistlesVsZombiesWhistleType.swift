import UIKit

class MOptionWhistlesVsZombiesWhistleType
{
    let whistle:MOptionWhistlesVsZombiesWhistleProtocol
    private(set) weak var textures:MOptionWhistlesVsZombiesTextures!
    private(set) weak var textureGame:MGameTexture?
    private(set) var colour:UIColor
    private(set) var barrelLength:CGFloat
    
    init(
        whistle:MOptionWhistlesVsZombiesWhistleProtocol,
        textures:MOptionWhistlesVsZombiesTextures)
    {
        self.whistle = whistle
        self.textures = textures
        colour = UIColor.clear
        barrelLength = 0
    }
}
