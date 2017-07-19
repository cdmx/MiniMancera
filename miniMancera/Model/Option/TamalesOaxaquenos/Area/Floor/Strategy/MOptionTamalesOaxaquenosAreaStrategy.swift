import Foundation

class MOptionTamalesOaxaquenosAreaStrategy
{
    init()
    
    //MARK: public
    
    func factoryItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        let item:MOptionTamalesOaxaquenosAreaFloorItemProtocol = factoryGroundItem(
            textures:textures,
            positionX:positionX)
        
        return item
    }
}
