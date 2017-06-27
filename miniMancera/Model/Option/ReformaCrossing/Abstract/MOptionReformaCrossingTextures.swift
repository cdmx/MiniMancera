import UIKit

class MOptionReformaCrossingTextures
{
    let background:MGameTexture
    let hud:MGameTexture
    let foeCyclerFemale:MGameTexture
    let foeFierroViejo:MGameTexture
    let foeLordAudi:MGameTexture
    let foeMetrobus:MGameTexture
    let foePolice:MGameTexture
    let foeRuta2:MGameTexture
    let foeTamales:MGameTexture
    let foeTaxiPink:MGameTexture
    let foeVW:MGameTexture
    let playerHitAndRun:MGameTexture
    let playerTimeout:MGameTexture
    let gameOver1up:MGameTexture
    let gameOverExit:MGameTexture
    
    init()
    {
        background = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        hud = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingHud"))
        foeCyclerFemale = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingCyclerFemale"))
        foeFierroViejo = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingFierroViejo"))
        foeLordAudi = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingLordAudi"))
        foeMetrobus = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingMetrobus"))
        foePolice = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPolice"))
        foeRuta2 = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingRuta2"))
        foeTamales = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingTamales"))
        foeTaxiPink = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingTaxiPink"))
        foeVW = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        playerHitAndRun = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer10"))
        playerTimeout = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer11"))
        gameOver1up = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossing1up"))
        gameOverExit = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingGameOver"))
    }
}
