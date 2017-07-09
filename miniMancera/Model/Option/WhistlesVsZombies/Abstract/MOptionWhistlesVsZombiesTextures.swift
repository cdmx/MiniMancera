import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let coin:MGameTexture
    let base:MGameTexture
    let menu:MGameTexture
    
    let sonicBoomAnimated:MGameTextureAnimated
    let sonicCollisionAnimated:MGameTextureAnimated
    let sonicReleaseAnimated:MGameTextureAnimated

    let whistlePink:MGameTexture
    let whistleBlue:MGameTexture
    let whistleOrange:MGameTexture
    let whistleExplodedAnimated:MGameTextureAnimated
    
    let playerStand:MGameTexture
    let playerSweat:MGameTexture
    let playerShut:MGameTexture
    let playerScared:MGameTexture
    let playerDefeated:MGameTexture
    
    let zombieFootballStand:MGameTexture
    let zombieFootballWalkingAnimated:MGameTextureAnimated
    let zombieFootballDefeatedAnimated:MGameTextureAnimated
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesBackground"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Background.rawValue)
        coin = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesZombieCoin"),
            zPosition:MOptionWhistlesVsZombiesZPosition.PointsCoin.rawValue)
        base = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBase"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Base.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesMenu"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Menu.rawValue)
        
        sonicBoomAnimated = MOptionWhistlesVsZombiesTextures.factorySonicBoomAnimated()
        sonicReleaseAnimated = MOptionWhistlesVsZombiesTextures.factorySonicReleaseAnimated()
        sonicCollisionAnimated = MOptionWhistlesVsZombiesTextures.factorySonicCollisionAnimated()
  
        whistlePink = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePink"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleBlue = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBlue"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleOrange = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleOrange"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleExplodedAnimated = MOptionWhistlesVsZombiesTextures.factoryWhistleExplodedAnimated()
        
        playerStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesPlayer0"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Player.rawValue)
        playerSweat = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesPlayer2"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Player.rawValue)
        playerShut = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesPlayer4"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Player.rawValue)
        playerScared = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesPlayer1"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Player.rawValue)
        playerDefeated = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesPlayer3"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Player.rawValue)
        
        zombieFootballStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballStand"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Zombie.rawValue)
        zombieFootballWalkingAnimated = MOptionWhistlesVsZombiesTextures.factoryFootballWalkingAnimated()
        zombieFootballDefeatedAnimated = MOptionWhistlesVsZombiesTextures.factoryFootballDefeatedAnimated()
    }
}
