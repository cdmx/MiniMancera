import UIKit

class MOptionReformaCrossingTextures
{
    let background:MGameTexture
    let hud:MGameTexture
    let playerHitAndRun:MGameTexture
    let playerTimeout:MGameTexture
    
    init()
    {
        background = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        hud = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingHud"))
        playerHitAndRun = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer10"))
        playerTimeout = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer11"))
    }
}
