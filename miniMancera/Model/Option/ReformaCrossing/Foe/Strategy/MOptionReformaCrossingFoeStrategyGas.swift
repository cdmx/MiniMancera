import SpriteKit

class MOptionReformaCrossingFoeStrategyGas:MGameStrategy<MOptionReformaCrossingFoeItem>
{
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        model.advance(elapsedTime:elapsedTime)
    }
}
