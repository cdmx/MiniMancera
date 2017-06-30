import UIKit

class MOptionReformaCrossingFoeItem:MGameUpdate<MOptionReformaCrossing>
{
    let created:TimeInterval
    weak var view:VOptionReformaCrossingFoe?
    private(set) weak var lane:MOptionReformaCrossingLane!
    private(set) weak var texture:MGameTexture!
    private(set) var minSpeed:CGFloat
    private(set) var randomMaxSpeed:UInt32
    private(set) var trip:MOptionReformaCrossingFoeItemTrip!
    private var strategy:MGameStrategy<MOptionReformaCrossingFoeItem, MOptionReformaCrossing>?
    
    required init(
        model:MOptionReformaCrossing,
        lane:MOptionReformaCrossingLane)
    {
        self.lane = lane
        created = Date().timeIntervalSince1970
        minSpeed = 0
        randomMaxSpeed = 0
        super.init()
        
        trip = lane.foeTrip(foe:self)
        strategyGas()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func strategyGas()
    {
        view?.gas()
        trip?.breaks()
        strategy = MOptionReformaCrossingFoeStrategyGas(model:self)
    }
    
    func breaks()
    {
        view?.breaks()
        strategy = MOptionReformaCrossingFoeStrategyBreaks(model:self)
    }
    
    func randomSpeed() -> CGFloat
    {
        let random:CGFloat = CGFloat(arc4random_uniform(randomMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random
        
        return totalSpeed
    }
}
