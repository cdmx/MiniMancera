import Foundation

class MGameStrategyMain<T:MGame>:MGameStrategy<T, T>
{
    private let updateItems:[MGameUpdate<T>]
    
    init(model:T, updateItems:[MGameUpdate<T>])
    {
        self.updateItems = updateItems
        super.init(model:model)
    }
    
    override func update(elapsedTime:TimeInterval, scene:ViewGameScene<T>)
    {
        for item:MGameUpdate in updateItems
        {
            item.update(elapsedTime:elapsedTime, scene:scene)
        }
    }
}
