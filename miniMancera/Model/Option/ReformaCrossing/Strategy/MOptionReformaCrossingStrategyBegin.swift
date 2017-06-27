import SpriteKit

class MOptionReformaCrossingStrategyBegin:MOptionReformaCrossingStrategy
{
    private let kTimeout:TimeInterval = 1.5
    
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene,
        model:MOptionReformaCrossing)
    {
        if elapsedTime > kTimeout
        {
            model.activateGame()
            
            let actionFadeIn:SKAction = model.actions.actionFadeIn
            let actionFadeOut:SKAction = model.actions.actionFadeOut
            
            model.hud.view?.run(actionFadeIn)
            model.title.view?.run(actionFadeOut)
        }
    }
}
