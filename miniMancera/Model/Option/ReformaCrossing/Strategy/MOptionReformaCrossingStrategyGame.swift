import SpriteKit

class MOptionReformaCrossingStrategyGame:MGameStrategy<MOptionReformaCrossing>
{
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        model.stop.update(
            elapsedTime:elapsedTime)
        model.hud.update(
            elapsedTime:elapsedTime,
            scene:scene,
            score:model.score)
        model.player.update(
            elapsedTime:elapsedTime,
            scene:scene)
        model.laneGroup.update(
            elapsedTime:elapsedTime,
            scene:scene)
        model.foe.update(
            elapsedTime:elapsedTime,
            scene:scene)
        model.contact.update(
            elapsedTime:elapsedTime)
    }
}
