import UIKit

class MOptionTamalesOaxaquenosTextures
{
    let background:MGameTexture
    let gameOver1up:MGameTexture
    let gameOverExit:MGameTexture
    
    let ground0:MGameTexture
    let ground1:MGameTexture
    let ground2:MGameTexture
    let ground3:MGameTexture
    
    let grass0:MGameTexture
    let grass1:MGameTexture
    let grass2:MGameTexture
    let grass3:MGameTexture
    
    let hill0:MGameTexture
    let hill1:MGameTexture
    let hill2:MGameTexture
    let hill3:MGameTexture
    
    let perspective0:MGameTexture
    let perspective1:MGameTexture
    let perspective2:MGameTexture
    let perspective3:MGameTexture
    
    let gullyStart:MGameTexture
    let gullyEnd:MGameTexture
    
    let playerStand:MGameTexture
    let playerWalkingAnimated:MGameTextureAnimated
    
    let menu:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosBackground"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Background.rawValue)
        gameOver1up = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenos1up"),
            zPosition:MOptionTamalesOaxaquenosZPosition.GameOver1up.rawValue)
        gameOverExit = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosGameOver"),
            zPosition:MOptionTamalesOaxaquenosZPosition.GameOverExit.rawValue)
        
        ground0 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        ground1 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround1"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        ground2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround2"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        ground3 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround3"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        
        grass0 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        grass1 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass1"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        grass2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass2"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        grass3 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass3"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        
        hill0 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileHill0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        hill1 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileHill1"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        hill2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileHill2"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        hill3 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileHill3"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        
        perspective0 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosPerspective0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Perspective.rawValue)
        perspective1 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosPerspective1"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Perspective.rawValue)
        perspective2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosPerspective2"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Perspective.rawValue)
        perspective3 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosPerspective3"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Perspective.rawValue)
        
        gullyStart = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGullyStart"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        gullyEnd = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGullyEnd"),
            zPosition:MOptionTamalesOaxaquenosZPosition.None.rawValue)
        
        playerStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosPlayer0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Player.rawValue)
        playerWalkingAnimated = MOptionTamalesOaxaquenosTextures.factoryPlayerWalkingAnimated()
        
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosMenu"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Menu.rawValue)
    }
}
