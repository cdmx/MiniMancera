import SpriteKit

class MOptionReformaCrossingPlayer:MGameUpdateProtocol
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
    
    func walk()
    {
        strategy = MOptionReformaCrossingPlayerStrategyWalk(model:self)
        view?.animateWalk()
    }
    
    func stop()
    {
        strategy = MOptionReformaCrossingPlayerStrategyStop(model:self)
        view?.animateStop()
    }
    
    func timeOut()
    {
        view?.timeOut()
    }
    
    func success()
    {
        view?.success()
    }
    
    func hitAndRun()
    {
        view?.hitAndRun()
    }
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
}
