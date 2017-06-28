import SpriteKit

class MOptionReformaCrossingTextures
{
    let background:MGameTexture
    let hud:MGameTexture
    let menu:MGameTexture
    let gameOver1up:MGameTexture
    let gameOverExit:MGameTexture
    
    let stop:MGameTexture
    let stopAnimated:MGameTextureAnimated
    
    let playerStand:MGameTexture
    let playerHitAndRun:MGameTexture
    let playerTimeout:MGameTexture
    let playerSuccess:MGameTexture
    let playerAnimatedWalk:MGameTextureAnimated
    let playerAnimatedStop:MGameTextureAnimated
    
    let foeCyclerFemale:MGameTexture
    let foeFierroViejo:MGameTexture
    let foeLordAudi:MGameTexture
    let foeMetrobus:MGameTexture
    let foePolice:MGameTexture
    let foeRuta2:MGameTexture
    let foeTamales:MGameTexture
    let foeTaxiPink:MGameTexture
    let foeVW:MGameTexture
    
    private class func factoryStopAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetReformaCrossingStop1"),
            #imageLiteral(resourceName: "assetReformaCrossingStop2"),
            #imageLiteral(resourceName: "assetReformaCrossingStop3"),
            #imageLiteral(resourceName: "assetReformaCrossingStop4"),
            #imageLiteral(resourceName: "assetReformaCrossingStop5")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    private class func factoryPlayerAnimatedWalk() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetReformaCrossingPlayer1"),
            #imageLiteral(resourceName: "assetReformaCrossingPlayer2"),
            #imageLiteral(resourceName: "assetReformaCrossingPlayer3"),
            #imageLiteral(resourceName: "assetReformaCrossingPlayer4"),
            #imageLiteral(resourceName: "assetReformaCrossingPlayer5"),
            #imageLiteral(resourceName: "assetReformaCrossingPlayer6")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    private class func factoryPlayerAnimatedStop() -> MGameTextureAnimated
    {
        let textureWalking0:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"))
        let textureWalking7:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer7"))
        let textureWalking8:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer8"))
        let textureWalking9:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer9"))
        
        let textures:[SKTexture] = [
            textureWalking0,
            textureWalking7,
            textureWalking8,
            textureWalking9,
            textureWalking8,
            textureWalking7,
            textureWalking0]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            textures:textures)
        
        return texture
    }
    
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
        gameOver1up = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossing1up"),
            zPosition:MOptionReformaCrossingZPosition.GameOver1up.rawValue)
        gameOverExit = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingGameOver"),
            zPosition:MOptionReformaCrossingZPosition.GameOverExit.rawValue)
        
        stop = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingStop0"),
            zPosition:MOptionReformaCrossingZPosition.Stop.rawValue)
        stopAnimated = MOptionReformaCrossingTextures.factoryStopAnimated()
        
        playerStand = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"),
            zPosition:MOptionReformaCrossingZPosition.Player.rawValue)
        playerHitAndRun = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPlayer10"),
            zPosition:MOptionReformaCrossingZPosition.GameOverPlayer.rawValue)
        playerTimeout = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPlayer11"),
            zPosition:MOptionReformaCrossingZPosition.GameOverPlayer.rawValue)
        playerSuccess = MGameTexture(
            image:#imageLiteral(resourceName: "assetReformaCrossingPlayer12"),
            zPosition:MOptionReformaCrossingZPosition.GameOverPlayer.rawValue)
        playerAnimatedWalk = MOptionReformaCrossingTextures.factoryPlayerAnimatedWalk()
        playerAnimatedStop = MOptionReformaCrossingTextures.factoryPlayerAnimatedStop()
        
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
