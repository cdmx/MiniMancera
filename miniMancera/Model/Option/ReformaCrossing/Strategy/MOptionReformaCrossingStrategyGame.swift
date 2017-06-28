import SpriteKit

class MOptionReformaCrossingStrategyGame:MGameStrategy<MOptionReformaCrossing>
{
    private let updateItems:[MGameUpdateProtocol]
    
    override init(model:MOptionReformaCrossing)
    {
        updateItems = [
            model.stop,
            model.hud,
            model.player,
            model.laneGroup,
            model.foe,
            model.contact]
        
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
