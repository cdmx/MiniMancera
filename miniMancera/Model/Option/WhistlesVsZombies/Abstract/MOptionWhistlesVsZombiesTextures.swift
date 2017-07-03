import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let base:MGameTexture
    let boardCancel:MGameTexture
    
    let whistlePinkBoard:MGameTexture
    let whistleBlueBoard:MGameTexture
    let whistleOrangeBoard:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesBackground"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Background.rawValue)
        base = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBase"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Base.rawValue)
        boardCancel = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleMenuCancel"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardCancel.rawValue)
        
        whistlePinkBoard = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkHorizontal"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardWhistle.rawValue)
        whistleBlueBoard = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBlueHorizontal"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardWhistle.rawValue)
        whistleOrangeBoard = MGameTexture(
            image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleOrangeHorizontal"),
            zPosition:MOptionWhistlesVsZombiesZPosition.BoardWhistle.rawValue)
    }
}
