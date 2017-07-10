import SpriteKit

class MOptionWhistlesVsZombiesStrategyBegin:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = [
            model.player,
            model.sonicBoom,
            model.zombie,
            model.hud]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kWait
            {
                timeOut()
            }
        }
        else
        {
            startingTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func timeOut()
    {
        model.activateGame()
        
        let actionFadeIn:SKAction = model.actions.actionFadeIn
        let actionFadeOut:SKAction = model.actions.actionFadeOut
        
        model.viewMenu?.run(actionFadeIn)
        model.hud.view?.run(actionFadeIn)
//        model.title.view?.run(actionFadeOut)
    }
}
