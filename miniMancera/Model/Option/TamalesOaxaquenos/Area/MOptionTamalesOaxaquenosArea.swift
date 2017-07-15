import UIKit

class MOptionTamalesOaxaquenosArea:MGameUpdate<MOptionTamalesOaxaquenos>
{
    static let kAreaWidth:CGFloat = 10000
    
    let floorItems:[MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    let perspectiveItems:[MOptionTamalesOaxaquenosAreaPerspectiveItem]
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        floorItems = MOptionTamalesOaxaquenosArea.factoryFloorItems(textures:textures)
        perspectiveItems = MOptionTamalesOaxaquenosArea.factoryPerspectiveItems(textures:textures)
        
        super.init()
    }
}
