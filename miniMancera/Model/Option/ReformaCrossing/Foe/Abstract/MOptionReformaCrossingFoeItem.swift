import UIKit

class MOptionReformaCrossingFoeItem
{
    let created:TimeInterval
    weak var view:VOptionReformaCrossingFoe!
    private(set) weak var lane:MOptionReformaCrossingLane!
    private(set) weak var texture:MGameTexture!
    private(set) var minSpeed:CGFloat
    private(set) var randomMaxSpeed:UInt32
    private(set) var trip:MOptionReformaCrossingFoeItemTrip?
    private var strategy:MOptionReformaCrossingFoeStrategy?
    
    required init?(
        model:MOptionReformaCrossing,
        lane:MOptionReformaCrossingLane)
    {
        return nil
    }
    
    init(lane:MOptionReformaCrossingLane, texture:MGameTexture)
    {
        self.texture = texture
        self.lane = lane
        created = Date().timeIntervalSince1970
        minSpeed = 0
        randomMaxSpeed = 0
        trip = lane.foeTrip(foe:self)
    }
    
    //MARK: public
    
    func strategyGas()
    {
        strategy = MOptionReformaCrossingFoeStrategyGas(model:self)
    }
    
    func strategyBreaks()
    {
        strategy = MOptionReformaCrossingFoeStrategyBreaks(model:self)
    }
    
    func randomSpeed() -> CGFloat
    {
        let random:CGFloat = CGFloat(arc4random_uniform(randomMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random
        
        return totalSpeed
    }
    
    func update(elapsedTime:TimeInterval)
    {
        strategy?.update(elapsedTime:elapsedTime)
    }
    
    func advance(elapsedTime:TimeInterval)
    {
        guard
            
            let trip:MOptionReformaCrossingFoeItemTrip = self.trip
        
        else
        {
            return
        }
        
        let reachedDestination:Bool = trip.reachedDestination()
        
        if reachedDestination
        {
            print("remove foe")
        }
        else
        {
            trip.advance(elapsedTime:elapsedTime)
            view.positionWithTrip(trip:trip)
        }
    }
}
