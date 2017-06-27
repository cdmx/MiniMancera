import SpriteKit

class MOptionReformaCrossingStrategyGame:MOptionReformaCrossingStrategy
{
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene,
        model:MOptionReformaCrossing)
    {
        model.hud.update(
            elapsedTime:elapsedTime,
            scene:scene,
            score:model.score)
        model.foe.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
}
