import SpriteKit

class MOptionPollutedGardenTextures
{
    let background:MGameTexture
    let floor:MGameTexture
    let playerStand:MGameTexture
    let playerDefeated:MGameTexture
    let playerAnimated:MGameTextureAnimated
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
        playerStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPlayer1"),
            zPosition:MOptionPollutedGardenZPosition.Player.rawValue)
        playerDefeated = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPlayer0"),
            zPosition:MOptionPollutedGardenZPosition.Player.rawValue)
        playerAnimated = MOptionPollutedGardenTextures.factoryPlayerAnimated()
        hud = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenHud"),
            zPosition:MOptionPollutedGardenZPosition.Hud.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenMenu"),
            zPosition:MOptionPollutedGardenZPosition.Menu.rawValue)
    }
    
    //MARK: private
    
    private class func factoryPlayerAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenPlayer2"),
            #imageLiteral(resourceName: "assetPollutedGardenPlayer3")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
}
