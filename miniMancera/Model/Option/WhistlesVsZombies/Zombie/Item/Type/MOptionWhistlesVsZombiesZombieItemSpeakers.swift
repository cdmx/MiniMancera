import SpriteKit

class MOptionWhistlesVsZombiesZombieItemSpeakers:MOptionWhistlesVsZombiesZombieItemProtocol
{
    private(set) weak var textureStand:MGameTexture!
    private(set) weak var animatedWalking:SKAction!
    private(set) var animatedDefeat:SKAction!
    private(set) var verticalDelta:CGFloat
    private(set) var speed:Int
    private(set) var intelligence:Int
    private(set) var life:Int
    private(set) var coins:Int
    private let kVerticalDelta:CGFloat = -3
    private let kSpeed:Int = 8
    private let kIntelligence:Int = 2
    private let kLife:Int = 25
    private let kCoins:Int = 1
    
    required init(
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
    {
        textureStand = textures.zombieFootballStand
        animatedWalking = actions.actionZombieFootballWakingAnimation
        animatedDefeat = actions.actionZombieFootballDefeatedAnimation
        verticalDelta = kVerticalDelta
        speed = kSpeed
        intelligence = kIntelligence
        life = kLife
        coins = kCoins
    }
}
