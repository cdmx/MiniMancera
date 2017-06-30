import UIKit

class MOptionReformaCrossingCoinItem:MGameUpdate<MOptionReformaCrossing>
{
    let positionY:CGFloat
    weak var view:VOptionReformaCrossingCoin?
    private var strategy:MGameStrategy<MOptionReformaCrossingCoinItem, MOptionReformaCrossing>?
    
    init(positionY:CGFloat)
    {
        self.positionY = positionY
        super.init()
        
        strategy = MOptionReformaCrossingCoinItemStrategyWaiting(model:self)
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
    
    func showCoin()
    {
        strategy = MOptionReformaCrossingCoinItemStrategyShowing(model:self)
    }
    
    func fadeCoin()
    {
        strategy = MOptionReformaCrossingCoinItemStrategyFading(model:self)
    }
    
    func collected()
    {
        view?.collected()
        strategy = MOptionReformaCrossingCoinItemStrategyCollected(model:self)
    }
}
