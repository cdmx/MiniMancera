import SpriteKit

class MOptionReformaCrossingCoinItem:MGameUpdateProtocol
{
    let positionY:CGFloat
    weak var view:VOptionReformaCrossingCoin?
    private var strategy:MGameStrategy<MOptionReformaCrossingCoinItem>?
    
    init(positionY:CGFloat)
    {
        self.positionY = positionY
        strategy = MOptionReformaCrossingCoinItemStrategyWaiting(model:self)
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
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
}
