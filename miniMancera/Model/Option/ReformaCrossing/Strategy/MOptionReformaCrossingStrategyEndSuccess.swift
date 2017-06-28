import SpriteKit

class MOptionReformaCrossingStrategyEndSuccess:MOptionReformaCrossingStrategyEnd
{
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        keepAdvancing(
            elapsedTime:elapsedTime,
            scene:scene)
        
        super.update(elapsedTime:elapsedTime, scene:scene)
    }
    
    override func timeOut(controller:ControllerGame<MOptionReformaCrossing>)
    {
    }
}
