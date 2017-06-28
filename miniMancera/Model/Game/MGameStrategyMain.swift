import SpriteKit

class MGameStrategyMain<T:MGame>:MGameStrategy<T>
{
    private let updateItems:[MGameUpdateProtocol]
    
    init(model:T, updateItems:[MGameUpdateProtocol])
    {
        self.updateItems = updateItems
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        for item:MGameUpdateProtocol in updateItems
        {
            item.update(elapsedTime:elapsedTime, scene:scene)
        }
    }
}
