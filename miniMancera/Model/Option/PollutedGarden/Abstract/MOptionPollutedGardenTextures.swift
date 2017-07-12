import UIKit

class MOptionPollutedGardenTextures
{
    let background:MGameTexture
    let floor:MGameTexture
    let pot:MGameTexture
    let hud:MGameTexture
    let menu:MGameTexture
    let gameOver1up:MGameTexture
    let gameOverExit:MGameTexture
    let collect:MGameTexture
    let poison:MGameTexture
    let plantPoisoned:MGameTexture
    
    let playerStand:MGameTexture
    let playerDefeated:MGameTexture
    let playerAnimated:MGameTextureAnimated
    
    let bubbleBig:MGameTexture
    let bubbleMedium:MGameTexture
    let bubbleSmall:MGameTexture
    let bubbleMini:MGameTexture
    let bubbleAnimated:MGameTextureAnimated
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBackground"),
            zPosition:MOptionPollutedGardenZPosition.Background.rawValue)
        floor = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenFloor"),
            zPosition:MOptionPollutedGardenZPosition.Floor.rawValue)
        pot = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenFlowerPot"),
            zPosition:MOptionPollutedGardenZPosition.Pot.rawValue)
        hud = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenHud"),
            zPosition:MOptionPollutedGardenZPosition.Hud.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenMenu"),
            zPosition:MOptionPollutedGardenZPosition.Menu.rawValue)
        gameOver1up = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossing1up"),
            zPosition:MOptionPollutedGardenZPosition.GameOver1up.rawValue)
        gameOverExit = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingGameOver"),
            zPosition:MOptionPollutedGardenZPosition.GameOverExit.rawValue)
        collect = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPlusFlower"),
            zPosition:MOptionPollutedGardenZPosition.Collect.rawValue)
        poison = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPollution"),
            zPosition:MOptionPollutedGardenZPosition.Poison.rawValue)
        plantPoisoned = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPetunia12"),
            zPosition:MOptionPollutedGardenZPosition.Plant.rawValue)
        
        playerStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPlayer1"),
            zPosition:MOptionPollutedGardenZPosition.Player.rawValue)
        playerDefeated = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenPlayer0"),
            zPosition:MOptionPollutedGardenZPosition.Player.rawValue)
        playerAnimated = MOptionPollutedGardenTextures.factoryPlayerAnimated()
        
        bubbleBig = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBubbleBig"),
            zPosition:MOptionPollutedGardenZPosition.Bubble.rawValue)
        bubbleMedium = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBubbleMedium"),
            zPosition:MOptionPollutedGardenZPosition.Bubble.rawValue)
        bubbleSmall = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBubbleSmall"),
            zPosition:MOptionPollutedGardenZPosition.Bubble.rawValue)
        bubbleMini = MGameTexture(
            image:#imageLiteral(resourceName: "assetPollutedGardenBubbleMini"),
            zPosition:MOptionPollutedGardenZPosition.Bubble.rawValue)
        bubbleAnimated = MOptionPollutedGardenTextures.factoryBubbleAnimated()
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
    
    private class func factoryBubbleAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion0"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion1"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion2"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion3"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion4"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion5")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
}
