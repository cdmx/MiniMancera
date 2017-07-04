import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let base:MGameTexture
    let menu:MGameTexture
    let sonicBoom:MGameTexture
    let sonicReleaseAnimated:MGameTextureAnimated

    let whistlePinkGame:MGameTexture
    let whistleBlueGame:MGameTexture
    let whistleOrangeGame:MGameTexture
    
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
        sonicBoom = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom"),
            zPosition:MOptionWhistlesVsZombiesZPosition.SonicBoom.rawValue)
        sonicReleaseAnimated = MOptionWhistlesVsZombiesTextures.factorySonicReleaseAnimated()
  
        whistlePinkGame = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkStand"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleBlueGame = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkStand"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
        whistleOrangeGame = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkStand"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Whistle.rawValue)
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
}
