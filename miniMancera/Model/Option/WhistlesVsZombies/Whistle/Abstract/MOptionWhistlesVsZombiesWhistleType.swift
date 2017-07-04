import UIKit

class MOptionWhistlesVsZombiesWhistleType
{
    weak var view:VOptionWhistlesVsZombiesBoardWhistle?
    private(set) weak var textures:MOptionWhistlesVsZombiesTextures!
    private(set) weak var textureBoard:MGameTexture?
    private(set) weak var textureGame:MGameTexture?
    private(set) var titleBoard:String?
    private(set) var descrBoard:String?
    private(set) var colour:UIColor?
    private(set) var speed:CGFloat
    private(set) var power:CGFloat
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        self.textures = textures
        speed = 0
        power = 0
    }
}
