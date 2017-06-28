import SpriteKit

class MOptionReformaCrossingPlayer
{
    weak var view:VOptionReformaCrossingPlayer?
    private var strategy:MGameStrategy<MOptionReformaCrossingPlayer>?
    
    //MARK: public
    
    func activateGame()
    {
        view?.isHidden = false
        walk()
    }
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    func walk()
    {
        strategy = MOptionReformaCrossingPlayerStrategyWalk(model:self)
    }
    
    func stop()
    {
        strategy = MOptionReformaCrossingPlayerStrategyStop(model:self)
    }
}
