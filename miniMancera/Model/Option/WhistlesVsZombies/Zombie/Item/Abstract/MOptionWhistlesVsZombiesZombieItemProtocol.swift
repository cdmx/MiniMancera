import SpriteKit

protocol MOptionWhistlesVsZombiesZombieItemProtocol:class
{
    init(
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
    
    weak var textureStand:MGameTexture! { get }
    weak var animatedWalking:SKAction! { get }
    weak var animatedDefeat:SKAction! { get }
    var speed:Int { get }
    var intelligence:Int { get }
    var strength:Int { get }
    var life:Int { get }
    var coins:Int { get }
}
