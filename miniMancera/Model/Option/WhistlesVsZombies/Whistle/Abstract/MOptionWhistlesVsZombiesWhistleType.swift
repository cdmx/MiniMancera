import Foundation

class MOptionWhistlesVsZombiesWhistleType
{
    weak var view:VOptionWhistlesVsZombiesBoardWhistle?
    private(set) weak var textures:MOptionWhistlesVsZombiesTextures!
    private(set) weak var textureBoard:MGameTexture?
    private(set) weak var textureGame:MGameTexture?
    private(set) var titleBoard:String?
    private(set) var descrBoard:String?
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        self.textures = textures
    }
}
