import UIKit

class MOptionWhistlesVsZombiesWhistleTypePink:MOptionWhistlesVsZombiesWhistleTypeProtocol
{
    private weak var gameTexture:MGameTexture!
    private let modelWhistle:MOptionWhistlesVsZombiesWhistlePink
    private let kBarrelLength:CGFloat = 20
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        modelWhistle = MOptionWhistlesVsZombiesWhistlePink()
        gameTexture = textures.whistlePinkGame
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
}
