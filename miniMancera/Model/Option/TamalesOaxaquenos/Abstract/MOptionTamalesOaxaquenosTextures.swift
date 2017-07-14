import UIKit

class MOptionTamalesOaxaquenosTextures
{
    let ground0:MGameTexture
    let ground1:MGameTexture
    let ground2:MGameTexture
    let ground3:MGameTexture
    let grass:MGameTexture
    
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
        grass = MGameTexture(
            image:#imageLiteral(resourceName: "assetTamalesOaxaquenosTileGrass"),
            zPosition:MOptionTamalesOaxaquenosZPosition.Ground.rawValue)
    }
}
