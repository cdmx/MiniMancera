import SpriteKit

class MOptionPollutedGardenTextures
{
    let background:MGameTexture
    let menu:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBackground"),
            zPosition:MOptionPollutedGardenZPosition.Background.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenMenu"),
            zPosition:MOptionPollutedGardenZPosition.Menu.rawValue)
    }
}
