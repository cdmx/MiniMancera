import UIKit

class MOptionTamalesOaxaquenosArea:MGameUpdate<MOptionTamalesOaxaquenos>
{
    static let kAreaWidth:CGFloat = 10000
    
    let floorItems:[MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    let perspectiveItems:[MOptionTamalesOaxaquenosAreaPerspectiveItem]
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        let factoryFloor:MOptionTamalesOaxaquenosAreaFactoryFloor = MOptionTamalesOaxaquenosAreaFactoryFloor(
            textures:textures)
        floorItems = factoryFloor.floorItems()
        perspectiveItems = MOptionTamalesOaxaquenosArea.factoryPerspectiveItems(textures:textures)
        
        super.init()
    }
}
