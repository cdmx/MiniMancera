import SpriteKit

class MOptionReformaCrossingStrategyBegin:MGameStrategy<MOptionReformaCrossing>
{
    private let updateItems:[MGameUpdateProtocol]
    private let kTimeout:TimeInterval = 1.5
    
    override init(model:MOptionReformaCrossing)
    {
        updateItems = [
            model.laneGroup,
            model.foe,
            model.contact]
        
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        for item:MGameUpdateProtocol in updateItems
        {
            item.update(elapsedTime:elapsedTime, scene:scene)
        }
        
        if elapsedTime > kTimeout
        {
            timeout(scene:scene)
        }
    }
    
    //MARK: private
    
    private func timeout(scene:SKScene)
    {
        model.activateGame()

        let actionFadeIn:SKAction = model.actions.actionFadeIn
        let actionFadeOut:SKAction = model.actions.actionFadeOut
        
        model.menu.view?.run(actionFadeIn)
        model.hud.view?.run(actionFadeIn)
        model.stop.view?.run(actionFadeIn)
        model.title.view?.run(actionFadeOut)
    }
}
