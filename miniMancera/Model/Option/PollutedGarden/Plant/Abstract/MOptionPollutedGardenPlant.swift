import SpriteKit

class MOptionPollutedGardenPlant:MGameUpdate<MOptionPollutedGarden>
{
    private var items:[MOptionPollutedGardenPlantItem]
    private let position:MOptionPollutedGardenPlantPosition
    
    override init()
    {
        position = MOptionPollutedGardenPlantPosition()
        items = []
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
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
}
