import SpriteKit

class MOptionReformaCrossingStrategyEndSuccess:MOptionReformaCrossingStrategyEnd
{
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        model.laneGroup.update(elapsedTime:elapsedTime)
        
        super.update(elapsedTime:elapsedTime, scene:scene)
    }
    
    override func timeOut(controller:ControllerGame<MOptionReformaCrossing>)
    {
    }
}
