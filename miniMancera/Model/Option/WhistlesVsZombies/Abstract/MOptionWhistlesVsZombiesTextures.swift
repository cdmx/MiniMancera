import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    let base:MGameTexture
    let boardCancel:MGameTexture
    
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
    }
}
