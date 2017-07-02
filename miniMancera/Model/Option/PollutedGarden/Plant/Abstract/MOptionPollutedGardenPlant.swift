import UIKit

class MOptionPollutedGardenPlant:MGameUpdate<MOptionPollutedGarden>
{
    private var items:[MOptionPollutedGardenPlantItem]
    private let position:MOptionPollutedGardenPlantPosition
    
    override init()
    {
        position = MOptionPollutedGardenPlantPosition()
        items = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        for item:MOptionPollutedGardenPlantItem in items
        {
            item.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    //MARK: private
    
    private func newPlants(textures:MOptionPollutedGardenTextures)
    {
        let positions:[CGFloat] = position.randomPositions()
        var items:[MOptionPollutedGardenPlantItem] = []
        
        for position:CGFloat in positions
        {
            let item:MOptionPollutedGardenPlantItem = MOptionPollutedGardenPlantItem(
                textures:textures,
                positionX:position)
            
            items.append(item)
        }
        
        self.items = items
    }
    
    //MARK: public
    
    func restart(textures:MOptionPollutedGardenTextures)
    {
        newPlants(textures:textures)
    }
}
