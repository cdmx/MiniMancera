import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let base:MGameTexture
    let menu:MGameTexture
    let sonicBoomAnimated:MGameTextureAnimated
    let sonicReleaseAnimated:MGameTextureAnimated

    let whistlePinkGame:MGameTexture
    let whistleBlueGame:MGameTexture
    let whistleOrangeGame:MGameTexture
    
    let zombieFootballStand:MGameTexture
    let zombieFootballWalkingAnimated:MGameTextureAnimated
    
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
    
    private class func factoryFootballWalkingAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballWalking0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballWalking1")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
}
