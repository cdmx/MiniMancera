import SpriteKit

class MOptionReformaCrossingStrategyBegin:MGameStrategy<MOptionReformaCrossing>
{
    private let kTimeout:TimeInterval = 1.5
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        model.laneGroup.update(
            elapsedTime:elapsedTime,
            scene:scene)
        model.contact.update(
            elapsedTime:elapsedTime)
        
        if elapsedTime > kTimeout
        {
            timeout(scene:scene)
        }
    }
    
    //MARK: private
    
    private func timeout(scene:SKScene)
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
        model.stop.view?.run(actionFadeIn)
        model.title.view?.run(actionFadeOut)
    }
}
