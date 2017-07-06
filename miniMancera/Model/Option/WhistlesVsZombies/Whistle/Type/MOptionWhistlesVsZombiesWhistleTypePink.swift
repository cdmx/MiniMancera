import UIKit

class MOptionWhistlesVsZombiesWhistleTypePink:MOptionWhistlesVsZombiesWhistleTypeProtocol
{
    private(set) var whistle:MOptionWhistlesVsZombiesWhistleProtocol
    private(set) var boardItemType:MOptionWhistlesVsZombiesBoardItemProtocol.Type
    private(set) var textureGame:MGameTexture
    private(set) var colour:UIColor
    private(set) var barrelLength:CGFloat
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        whistle = MOptionWhistlesVsZombiesWhistlePink()
        boardItemType = MOptionWhistlesVsZombiesBoardItemPink.self
        textureGame = textures.whistlePinkGame
        colour = UIColor(
            red:1,
            green:0.352941176470588,
            blue:1,
            alpha:1)
        barrelLength = kBarrelLength
    }
}
