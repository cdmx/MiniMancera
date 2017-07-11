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
    private let kVerticalDelta:CGFloat = -2
    private let kSpeed:Int = 5
    private let kIntelligence:Int = 4
    private let kLife:Int = 50
    private let kCoins:Int = 3
    
    required init(
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
    {
        textureStand = textures.zombieSpeakersStand
        animatedWalking = actions.actionZombieSpeakersWalkingAnimation
        animatedDefeat = actions.actionZombieSpeakersDefeatedAnimation
        verticalDelta = kVerticalDelta
        speed = kSpeed
        intelligence = kIntelligence
        life = kLife
        coins = kCoins
    }
}
