import SpriteKit

class MOptionReformaCrossingStrategyBegin:MGameStrategyMain<MOptionReformaCrossing>
{
    private let kTimeout:TimeInterval = 1.5
    
    init(model:MOptionReformaCrossing)
    {
        let updateItems:[MGameUpdate<MOptionReformaCrossing>] = [
            model.laneGroup,
            model.foe,
            model.contact]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
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
        model.hud.view?.run(actionFadeIn)
        model.stop.view?.run(actionFadeIn)
        model.title.view?.run(actionFadeOut)
    }
}
