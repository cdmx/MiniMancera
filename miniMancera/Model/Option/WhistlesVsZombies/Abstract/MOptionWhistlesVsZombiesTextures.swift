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
    
    //MARK: private
    
    private class func factorySonicReleaseAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease2"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease3"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease4"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease5")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    private class func factorySonicBoomAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom2"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom3"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom4")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    private class func factorySonicCollisionAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision2"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision3"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision4"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision5")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    private class func factoryFootballWalkingAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballWalking0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballWalking1")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    private class func factoryFootballDefeatedAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballDefeated0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballDefeated1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballDefeated2")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
}
