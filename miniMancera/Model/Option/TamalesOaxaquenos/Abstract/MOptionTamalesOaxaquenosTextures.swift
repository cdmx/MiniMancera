import UIKit

class MOptionTamalesOaxaquenosTextures
{
    let ground0:MGameTexture
    let ground1:MGameTexture
    let ground2:MGameTexture
    let ground3:MGameTexture
    let grass0:MGameTexture
    let grass1:MGameTexture
    let grass2:MGameTexture
    let grass3:MGameTexture
    
    init()
    {
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
    }
}
