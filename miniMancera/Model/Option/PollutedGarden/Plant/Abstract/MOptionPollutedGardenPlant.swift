import UIKit

class MOptionPollutedGardenPlant:MGameUpdate<MOptionPollutedGarden>
{
    private var items:[MOptionPollutedGardenPlantItem]
    private var collect:[MOptionPollutedGardenPlantCollect]
    private var poison:[MOptionPollutedGardenPlantPoison]
    private let animations:MOptionPollutedGardenPlantAnimations
    private let position:MOptionPollutedGardenPlantPosition
    
    override init()
    {
        position = MOptionPollutedGardenPlantPosition()
        animations = MOptionPollutedGardenPlantAnimations()
        items = []
        collect = []
        poison = []
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
        
        for item:MOptionPollutedGardenPlantPoison in poison
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
        poison = []
        collect = []
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
    
    func poisonStart(plantItem:MOptionPollutedGardenPlantItem)
    {
        let poisonItem:MOptionPollutedGardenPlantPoison = MOptionPollutedGardenPlantPoison(
            plantItem:plantItem)
        poison.append(poisonItem)
        
        plantItem.polluted()
    }
    
    func poisonFinished(poisonItem:MOptionPollutedGardenPlantPoison)
    {
        var items:[MOptionPollutedGardenPlantPoison] = []
        
        for item:MOptionPollutedGardenPlantPoison in poison
        {
            if item !== poisonItem
            {
                items.append(item)
            }
        }
        
        poison = items
    }
}
