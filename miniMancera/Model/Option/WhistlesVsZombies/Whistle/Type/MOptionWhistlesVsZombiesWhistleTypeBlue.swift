import UIKit

class MOptionWhistlesVsZombiesWhistleTypeBlue:MOptionWhistlesVsZombiesWhistleTypeProtocol
{
    private(set) var whistle:MOptionWhistlesVsZombiesWhistleProtocol
    private(set) var boardItemType:MOptionWhistlesVsZombiesBoardItemProtocol.Type
    private(set) var textureGame:MGameTexture
    private(set) var colour:UIColor
    private(set) var barrelLength:CGFloat
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        whistle = MOptionWhistlesVsZombiesWhistleBlue()
        boardItemType = MOptionWhistlesVsZombiesBoardItemBlue.self
        textureGame = textures.whistleBlueGame
        colour = UIColor(
            red:0.290196078431373,
            green:0.564705882352941,
            blue:0.886274509803922,
            alpha:1)
        barrelLength = kBarrelLength
    }
}
