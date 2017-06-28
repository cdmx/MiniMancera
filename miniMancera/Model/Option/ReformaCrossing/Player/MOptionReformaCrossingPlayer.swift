import SpriteKit

class MOptionReformaCrossingPlayer
{
    let position:MOptionReformaCrossingPlayerPosition
    private var strategy:MGameStrategy<MOptionReformaCrossingPlayer>?
    
    init()
    {
        position = MOptionReformaCrossingPlayerPosition()
    }
    
    weak var view:VOptionReformaCrossingPlayer?
    {
        didSet
        {
            measureSafePosition()
        }
    }
    
    //MARK: private
    
    private func measureSafePosition()
    {
        guard
            
            let view:VOptionReformaCrossingPlayer = self.view
        
        else
        {
            return
        }
        
        position.playerView(view:view)
    }
    
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
