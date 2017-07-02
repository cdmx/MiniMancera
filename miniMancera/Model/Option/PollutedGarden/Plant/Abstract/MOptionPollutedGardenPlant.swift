import UIKit

class MOptionPollutedGardenPlant:MGameUpdate<MOptionPollutedGarden>
{
    private var items:[MOptionPollutedGardenPlantItem]
    private let animations:MOptionPollutedGardenPlantAnimations
    private let position:MOptionPollutedGardenPlantPosition
    
    override init()
    {
        position = MOptionPollutedGardenPlantPosition()
        animations = MOptionPollutedGardenPlantAnimations()
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
    
    //MARK: public
    
    func factoryAnimations(
        textures:MOptionPollutedGardenTextures,
        actions:MOptionPollutedGardenActions)
    {
        animations.factoryAnimations(
            textures:textures,
            actions:actions)
    }
    
    func restart()
    {
        let positions:[CGFloat] = position.randomPositions()
        var items:[MOptionPollutedGardenPlantItem] = []
        
        for position:CGFloat in positions
        {
            let item:MOptionPollutedGardenPlantItem = MOptionPollutedGardenPlantItem(
                animations:animations,
                positionX:position)
            
            items.append(item)
        }
        
        self.items = items
    }
}
