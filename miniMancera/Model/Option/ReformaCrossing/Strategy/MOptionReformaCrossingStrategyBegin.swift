import SpriteKit

class MOptionReformaCrossingStrategyBegin:MOptionReformaCrossingStrategy
{
    private let kTimeout:TimeInterval = 1.5
    
    func update(elapsedTime:TimeInterval, scene:SKScene, model:MOptionReformaCrossing)
    {
        if elapsedTime > kTimeout
        {
            model.activateGame()
            
            guard
            
                let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
            
            else
            {
                return
            }
            
            let actionFadeIn:SKAction = model.actions.actionFadeIn
            model.hud.view?.run(actionFadeIn)
        }
    }
}
