import UIKit

class MOptionWhistlesVsZombiesWhistleTypeOrange:MOptionWhistlesVsZombiesWhistleTypeProtocol
{
    private(set) var whistle:MOptionWhistlesVsZombiesWhistleProtocol
    private(set) var boardItemType:MOptionWhistlesVsZombiesBoardItemProtocol.Type
    private(set) var texture:MGameTexture
    private(set) var colour:UIColor
    private(set) var barrelLength:CGFloat
    private let kBarrelLength:CGFloat = 18
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        whistle = MOptionWhistlesVsZombiesWhistleOrange()
        boardItemType = MOptionWhistlesVsZombiesBoardItemOrange.self
        texture = textures.whistleOrange
        colour = UIColor(
            red:0.96078431372549,
            green:0.650980392156863,
            blue:0.137254901960784,
            alpha:1)
        barrelLength = kBarrelLength
    }
}
