import UIKit

class MOptionReformaCrossingTextures
{
    let background:MGameTexture
    let hud:MGameTexture
    
    init()
    {
        background = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        hud = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingHud"))
    }
}
