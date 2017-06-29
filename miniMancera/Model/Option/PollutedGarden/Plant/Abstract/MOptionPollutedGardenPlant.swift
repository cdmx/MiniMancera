import SpriteKit

class MOptionPollutedGardenPlant:MGameUpdateProtocol
{
    private var items:[MOptionPollutedGardenPlantItem]
    private let position:MOptionPollutedGardenPlantPosition
    
    init()
    {
        position = MOptionPollutedGardenPlantPosition()
        items = []
    }
    
    //MARK: private
    
    private func newPlants(textures:MOptionPollutedGardenTextures)
    {
        let positions:[CGFloat] = position.randomPositions()
        var items:[MOptionPollutedGardenPlantItem] = []
        
        for position:CGFloat in positions
        {
            
        }
        
        self.items = items
    }
    
    //MARK: public
    
    func restart(textures:MOptionPollutedGardenTextures)
    {
        newPlants(textures:textures)
    }
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        
    }
}
