import Foundation

class MOptionTamalesOaxaquenosArea:MGameUpdate<MOptionTamalesOaxaquenos>
{
    let items:[MOptionTamalesOaxaquenosAreaItemProtocol]
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        items = MOptionTamalesOaxaquenosArea.factoryItems(textures:textures)
        
        super.init()
    }
}
