import Foundation

class MOptionTamalesOaxaquenosArea:MGameUpdate<MOptionTamalesOaxaquenos>
{
    let floorItems:[MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        floorItems = MOptionTamalesOaxaquenosArea.factoryFloorItems(textures:textures)
        
        super.init()
    }
}
