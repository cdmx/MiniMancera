import SpriteKit

class MOptionReformaCrossingStrategyGame:MOptionReformaCrossingStrategy
{
    private(set) var model:MOptionReformaCrossing!
    
    required init(model:MOptionReformaCrossing)
    {
        self.model = model
    }
    
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        model.hud.update(
            elapsedTime:elapsedTime,
            scene:scene,
            score:model.score)
        model.laneGroup.update(
            elapsedTime:elapsedTime)
        model.foe.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
}
