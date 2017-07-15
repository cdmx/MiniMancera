import UIKit

extension MOptionTamalesOaxaquenosTextures
{
    class func factoryPlayerWalkingAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetTamalesOaxaquenosPlayer1"),
            #imageLiteral(resourceName: "assetTamalesOaxaquenosPlayer2")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
}
