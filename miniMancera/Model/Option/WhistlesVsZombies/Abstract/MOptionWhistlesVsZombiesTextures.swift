import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let base:MGameTexture
    let menu:MGameTexture
    let sonicBoomAnimated:MGameTextureAnimated
    let sonicCollisionAnimated:MGameTextureAnimated
    let sonicReleaseAnimated:MGameTextureAnimated

    let whistlePinkGame:MGameTexture
    let whistleBlueGame:MGameTexture
    let whistleOrangeGame:MGameTexture
    
    let zombieFootballStand:MGameTexture
    let zombieFootballWalkingAnimated:MGameTextureAnimated
    let zombieFootballDefeatedAnimated:MGameTextureAnimated
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesBackground"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Background.rawValue)
        base = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBase"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Base.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesMenu"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Menu.rawValue)
        sonicBoomAnimated = MOptionWhistlesVsZombiesTextures.factorySonicBoomAnimated()
        sonicReleaseAnimated = MOptionWhistlesVsZombiesTextures.factorySonicReleaseAnimated()
        sonicCollisionAnimated = MOptionWhistlesVsZombiesTextures.factorySonicCollisionAnimated()
  
        whistlePinkGame = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePink"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleBlueGame = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBlue"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleOrangeGame = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleOrange"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        
        zombieFootballStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballStand"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Zombie.rawValue)
        zombieFootballWalkingAnimated = MOptionWhistlesVsZombiesTextures.factoryFootballWalkingAnimated()
        zombieFootballDefeatedAnimated = MOptionWhistlesVsZombiesTextures.factoryFootballDefeatedAnimated()
    }
}
