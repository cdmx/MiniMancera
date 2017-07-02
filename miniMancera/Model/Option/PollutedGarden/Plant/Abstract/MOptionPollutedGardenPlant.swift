import UIKit

class MOptionPollutedGardenPlant:MGameUpdate<MOptionPollutedGarden>
{
    private var items:[MOptionPollutedGardenPlantItem]
    private var collect:[MOptionPollutedGardenPlantCollect]
    private let animations:MOptionPollutedGardenPlantAnimations
    private let position:MOptionPollutedGardenPlantPosition
    
    override init()
    {
        position = MOptionPollutedGardenPlantPosition()
        animations = MOptionPollutedGardenPlantAnimations()
        items = []
        collect = []
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
        
        for item:MOptionPollutedGardenPlantCollect in collect
        {
            item.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    //MARK: public
    
    func factoryAnimations(
        actions:MOptionPollutedGardenActions,
        textures:MOptionPollutedGardenTextures)
    {
        animations.factoryAnimations(
            actions:actions,
            textures:textures)
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
    
    func collectStart(plantItem:MOptionPollutedGardenPlantItem)
    {
        let collectItem:MOptionPollutedGardenPlantCollect = MOptionPollutedGardenPlantCollect(
            plantItem:plantItem)
        collect.append(collectItem)
    }
    
    func collectFinished(collectItem:MOptionPollutedGardenPlantCollect)
    {
        var items:[MOptionPollutedGardenPlantCollect] = []
        
        for item:MOptionPollutedGardenPlantCollect in collect
        {
            if item !== collectItem
            {
                items.append(item)
            }
        }
        
        collect = items
    }
}
