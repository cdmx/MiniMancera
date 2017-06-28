import SpriteKit

class MOptionReformaCrossingFoeItem
{
    let created:TimeInterval
    weak var view:VOptionReformaCrossingFoe!
    private(set) weak var lane:MOptionReformaCrossingLane!
    private(set) weak var texture:MGameTexture!
    private(set) var minSpeed:CGFloat
    private(set) var randomMaxSpeed:UInt32
    private(set) var trip:MOptionReformaCrossingFoeItemTrip!
    private(set) var strategy:MGameStrategy<MOptionReformaCrossingFoeItem>?
    
    required init(
        model:MOptionReformaCrossing,
        lane:MOptionReformaCrossingLane)
    {
        self.lane = lane
        created = Date().timeIntervalSince1970
        minSpeed = 0
        randomMaxSpeed = 0
        trip = lane.foeTrip(foe:self)
        
        strategyGas()
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    func strategyGas()
    {
        trip?.breaks()
        strategy = MOptionReformaCrossingFoeStrategyGas(model:self)
    }
    
    func breaks()
    {
        strategy = MOptionReformaCrossingFoeStrategyBreaks(model:self)
    }
    
    func randomSpeed() -> CGFloat
    {
        let random:CGFloat = CGFloat(arc4random_uniform(randomMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random
        
        return totalSpeed
    }
    
    func advance(elapsedTime:TimeInterval)
    {
        let reachedDestination:Bool = trip.reachedDestination()
        
        if reachedDestination
        {
            lane.removeFoe(item:self)
            view.removeFromParent()
        }
        else
        {
            trip.advance(elapsedTime:elapsedTime)
            view.positionWithTrip()
        }
    }
}
