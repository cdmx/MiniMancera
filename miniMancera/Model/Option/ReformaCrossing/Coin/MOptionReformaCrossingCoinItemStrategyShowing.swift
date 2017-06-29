import SpriteKit

class MOptionReformaCrossingCoinItemStrategyShowing:MGameStrategy<
    MOptionReformaCrossingCoinItem,
    MOptionReformaCrossing>
{
    private var elapsedTime:TimeInterval?
    private let kDuration:TimeInterval = 0.6
    
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        if let currentTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - currentTime
            
            if deltaTime > kDuration
            {
                guard
                    
                    let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
                    
                else
                {
                    return
                }
                
                let actionFade:SKAction = scene.controller.model.actions.actionFadeOut
                model.view?.run(actionFade)
                model.fadeCoin()
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
}
