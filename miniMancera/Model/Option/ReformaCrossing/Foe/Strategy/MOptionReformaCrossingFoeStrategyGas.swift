import SpriteKit

class MOptionReformaCrossingFoeStrategyGas:MGameStrategy<MOptionReformaCrossingFoeItem>
{
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        let reachedDestination:Bool = model.trip.reachedDestination()
        
        if reachedDestination
        {
            model.lane.removeFoe(item:model)
            model.view.removeFromParent()
        }
        else
        {
            model.trip.advance(elapsedTime:elapsedTime)
            model.view.positionWithTrip()
        }
    }
}
