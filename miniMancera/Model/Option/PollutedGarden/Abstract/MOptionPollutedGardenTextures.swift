import SpriteKit

class MOptionPollutedGardenTextures
{
    let background:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBackground"),
            zPosition:MOptionPollutedGardenZPosition.Background.rawValue)
    }
}
