import UIKit

class MOptionReformaCrossingTextures
{
    let background:MGameTexture
    let hud:MGameTexture
    let playerHitAndRun:MGameTexture
    let playerTimeout:MGameTexture
    let gameOver1up:MGameTexture
    let gameOverExit:MGameTexture
    
    init()
    {
        background = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        hud = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingHud"))
        playerHitAndRun = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer10"))
        playerTimeout = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer11"))
        gameOver1up = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossing1up"))
        gameOverExit = MGameTexture(image:#imageLiteral(resourceName: "assetReformaCrossingGameOver"))
    }
}
