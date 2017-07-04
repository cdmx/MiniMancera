import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let base:MGameTexture
    let menu:MGameTexture
    let boardCancel:MGameTexture
    let sonicBoom:MGameTexture
    let sonicReleaseAnimated:MGameTextureAnimated
    
    let whistlePinkBoard:MGameTexture
    let whistleBlueBoard:MGameTexture
    let whistleOrangeBoard:MGameTexture
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
        boardCancel = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleMenuCancel"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardCancel.rawValue)
        sonicBoom = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom"),
            zPosition:MOptionWhistlesVsZombiesZPosition.SonicBoom.rawValue)
        sonicReleaseAnimated = MOptionWhistlesVsZombiesTextures.factorySonicReleaseAnimated()
        
        whistlePinkBoard = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkHorizontal"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardWhistle.rawValue)
        whistleBlueBoard = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBlueHorizontal"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardWhistle.rawValue)
        whistleOrangeBoard = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleOrangeHorizontal"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardWhistle.rawValue)
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
