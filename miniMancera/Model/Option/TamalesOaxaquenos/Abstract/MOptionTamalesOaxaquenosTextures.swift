import UIKit

class MOptionTamalesOaxaquenosTextures
{
    let background:MGameTexture
    
    let ground0:MGameTexture
    let ground1:MGameTexture
    let ground2:MGameTexture
    let ground3:MGameTexture
    
    let grass0:MGameTexture
    let grass1:MGameTexture
    let grass2:MGameTexture
    let grass3:MGameTexture
    
    let perspective0:MGameTexture
    let perspective1:MGameTexture
    let perspective2:MGameTexture
    let perspective3:MGameTexture
    
    init()
    {
        background = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosBackground"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Background.rawValue)
        
        ground0 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        ground1 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround1"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        ground2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround2"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        ground3 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGround3"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        
        grass0 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass0"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        grass1 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass1"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        grass2 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass2"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        grass3 = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass3"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
        
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
    }
}
