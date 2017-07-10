import SpriteKit

class MOptionWhistlesVsZombiesZombieItemCop:MOptionWhistlesVsZombiesZombieItemProtocol
{
    private(set) weak var textureStand:MGameTexture!
    private(set) weak var animatedWalking:SKAction!
    private(set) var animatedDefeat:SKAction!
    private(set) var verticalDelta:CGFloat
    private(set) var speed:Int
    private(set) var intelligence:Int
    private(set) var life:Int
    private(set) var coins:Int
    private let kVerticalDelta:CGFloat = 2
    private let kSpeed:Int = 5
    private let kIntelligence:Int = 5
    private let kLife:Int = 35
    private let kCoins:Int = 2
    
    required init(
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
    {
        textureStand = textures.zombieCopStand
        animatedWalking = actions.actionZombieCopWalkingAnimation
        animatedDefeat = actions.actionZombieCopDefeatedAnimation
        verticalDelta = kVerticalDelta
        speed = kSpeed
        intelligence = kIntelligence
        life = kLife
        coins = kCoins
    }
}
