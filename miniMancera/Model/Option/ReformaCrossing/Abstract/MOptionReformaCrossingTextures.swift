import UIKit

class MOptionReformaCrossingTextures
{
    let background:MGameTexture
    let hud:MGameTexture
    let menu:MGameTexture
    let playerHitAndRun:MGameTexture
    let playerTimeout:MGameTexture
    let gameOver1up:MGameTexture
    let gameOverExit:MGameTexture
    
    let foeCyclerFemale:MGameTexture
    let foeFierroViejo:MGameTexture
    let foeLordAudi:MGameTexture
    let foeMetrobus:MGameTexture
    let foePolice:MGameTexture
    let foeRuta2:MGameTexture
    let foeTamales:MGameTexture
    let foeTaxiPink:MGameTexture
    let foeVW:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingBackground"),
            zPosition:MOptionReformaCrossingZPosition.Background.rawValue)
        hud = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingHud"),
            zPosition:MOptionReformaCrossingZPosition.Hud.rawValue)
        menu = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingMenu"),
            zPosition:MOptionReformaCrossingZPosition.Menu.rawValue)
        playerHitAndRun = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPlayer10"),
            zPosition:MOptionReformaCrossingZPosition.GameOverPlayer.rawValue)
        playerTimeout = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPlayer11"),
            zPosition:MOptionReformaCrossingZPosition.GameOverPlayer.rawValue)
        gameOver1up = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossing1up"),
            zPosition:MOptionReformaCrossingZPosition.GameOver1up.rawValue)
        gameOverExit = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingGameOver"),
            zPosition:MOptionReformaCrossingZPosition.GameOverExit.rawValue)
        
        foeCyclerFemale = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingCyclerFemale"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeFierroViejo = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingFierroViejo"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeLordAudi = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingLordAudi"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeMetrobus = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingMetrobus"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foePolice = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPolice"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeRuta2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingRuta2"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeTamales = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingTamales"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeTaxiPink = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingTaxiPink"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        foeVW = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingVW"),
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
    }
}
