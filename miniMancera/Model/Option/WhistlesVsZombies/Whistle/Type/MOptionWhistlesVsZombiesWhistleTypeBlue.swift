import UIKit

class MOptionWhistlesVsZombiesWhistleTypeBlue:MOptionWhistlesVsZombiesWhistleTypeProtocol
{
    private weak var gameTexture:MGameTexture!
    private let modelWhistle:MOptionWhistlesVsZombiesWhistleBlue
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        modelWhistle = MOptionWhistlesVsZombiesWhistleBlue()
        gameTexture = textures.whistleBlueGame
    }
    
    var whistle:MOptionWhistlesVsZombiesWhistleProtocol
    {
        get
        {
            return modelWhistle
        }
    }
    
    var textureGame:MGameTexture
    {
        get
        {
            return gameTexture
        }
    }
    
    var colour:UIColor
    {
        get
        {
            return UIColor.colourSuccess
        }
    }
    
    var barrelLength:CGFloat
    {
        get
        {
            return kBarrelLength
        }
    }
    
    var boardItemType:MOptionWhistlesVsZombiesBoardItemProtocol.Type
    {
        get
        {
            return MOptionWhistlesVsZombiesBoardItemBlue.self
        }
    }
}
