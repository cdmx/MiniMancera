import SpriteKit

class MOptionWhistlesVsZombiesZombieItemFootball:MOptionWhistlesVsZombiesZombieItemProtocol
{
    private(set) weak var textureStand:MGameTexture!
    private(set) weak var animatedWalking:SKAction!
    private(set) var speed:Int
    private(set) var intelligence:Int
    private(set) var strength:Int
    private(set) var life:Int
    private(set) var coins:Int
    private let kSpeed:Int = 7
    private let kIntelligence:Int = 2
    private let kStrength:Int = 3
    private let kLife:Int = 6
    private let kCoins:Int = 2
    
    required init(
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
    {
        textureStand = textures.zombieFootballStand
        animatedWalking = actions.actionZombieFootballWakingAnimation
        speed = kSpeed
        intelligence = kIntelligence
        strength = kStrength
        life = kLife
        coins = kCoins
    }
}