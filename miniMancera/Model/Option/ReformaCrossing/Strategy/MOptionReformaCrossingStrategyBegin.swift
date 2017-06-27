import SpriteKit

class MOptionReformaCrossingStrategyBegin:MOptionReformaCrossingStrategy
{
    private(set) var model:MOptionReformaCrossing!
    private let kTimeout:TimeInterval = 1.5
    
    required init(model:MOptionReformaCrossing)
    {
        self.model = model
    }
    
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        model.laneGroup.update(elapsedTime:elapsedTime)
        
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
            let actionFadeOut:SKAction = model.actions.actionFadeOut
            
            scene.menu.run(actionFadeIn)
            model.hud.view?.run(actionFadeIn)
            model.title.view?.run(actionFadeOut)
        }
    }
}
