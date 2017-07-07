import Foundation

protocol MOptionWhistlesVsZombiesZombieItemProtocol
{
    init(textures:MOptionWhistlesVsZombiesTextures)
    
    weak var textureStand:MGameTexture! { get }
    weak var textureAnimatedWalking:MGameTextureAnimated! { get }
    var speed:Int { get }
    var life:Int { get }
    var coins:Int { get }
}
