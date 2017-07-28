import UIKit

class MOptionTamalesOaxaquenosArea:MGameUpdate<MOptionTamalesOaxaquenos>
{
    static let kWidth:CGFloat = 10000
    
    let perspectiveItems:[MOptionTamalesOaxaquenosAreaPerspectiveItem]
    private(set) var floorItems:[MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    private weak var textures:MOptionTamalesOaxaquenosTextures!
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        self.textures = textures
        perspectiveItems = MOptionTamalesOaxaquenosArea.factoryPerspectiveItems(textures:textures)
        floorItems = []
        
        super.init()
    }
    
    //MARK: public
    
    func generateFloor()
    {
        let factoryFloor:MOptionTamalesOaxaquenosAreaFactoryFloor = MOptionTamalesOaxaquenosAreaFactoryFloor(
            textures:textures)
        floorItems = factoryFloor.floorItems()
    }
}
