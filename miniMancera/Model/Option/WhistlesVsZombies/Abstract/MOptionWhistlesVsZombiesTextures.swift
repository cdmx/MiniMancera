import UIKit

class MOptionWhistlesVsZombiesTextures
{
    let background:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBackground"),
            zPosition:MOptionWhistlesVsZombiesZPosition.Background.rawValue)
    }
}
