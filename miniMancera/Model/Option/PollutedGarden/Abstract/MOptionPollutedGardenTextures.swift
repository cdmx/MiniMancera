import SpriteKit

class MOptionPollutedGardenTextures
{
    let background:MGameTexture
    let floor:MGameTexture
    let hud:MGameTexture
    let menu:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBackground"),
            zPosition:MOptionPollutedGardenZPosition.Background.rawValue)
        floor = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenFloor"),
            zPosition:MOptionPollutedGardenZPosition.Floor.rawValue)
        hud = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenHud"),
            zPosition:MOptionPollutedGardenZPosition.Hud.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenMenu"),
            zPosition:MOptionPollutedGardenZPosition.Menu.rawValue)
    }
}
