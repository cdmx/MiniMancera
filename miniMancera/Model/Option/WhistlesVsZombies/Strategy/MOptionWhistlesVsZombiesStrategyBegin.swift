import SpriteKit

class MOptionWhistlesVsZombiesStrategyBegin:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    private let kTimeout:TimeInterval = 1.25
    
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = [
            model.player,
            model.sonicBoom,
            model.zombie]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if elapsedTime > kTimeout
        {
            timeout()
        }
    }
    
    //MARK: private
    
    private func timeout()
    {
        model.activateGame()
        
        let actionFadeIn:SKAction = model.actions.actionFadeIn
        let actionFadeOut:SKAction = model.actions.actionFadeOut
        
        model.viewMenu?.run(actionFadeIn)
//        model.hud.view?.run(actionFadeIn)
//        model.title.view?.run(actionFadeOut)
    }
}
