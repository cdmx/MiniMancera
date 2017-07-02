import Foundation

class MOptionReformaCrossingFoeStrategyGas:MGameStrategy<
    MOptionReformaCrossingFoeItem,
    MOptionReformaCrossing>
{
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let reachedDestination:Bool = model.trip.reachedDestination()
        
        if reachedDestination
        {
            model.lane.removeFoe(item:model)
            model.view?.removeFromParent()
        }
        else
        {
            model.trip.advance(elapsedTime:elapsedTime)
            model.view?.positionWithTrip()
        }
    }
}
