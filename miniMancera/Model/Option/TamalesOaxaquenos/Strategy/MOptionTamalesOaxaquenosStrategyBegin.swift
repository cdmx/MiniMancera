import SpriteKit

class MOptionTamalesOaxaquenosStrategyBegin:MGameStrategyMain<MOptionTamalesOaxaquenos>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 2
    
    init(model:MOptionTamalesOaxaquenos)
    {
        let updateItems:[MGameUpdate<MOptionTamalesOaxaquenos>] = [
            model.contact,
            model.controls,
            model.camera,
            model.player]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
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
//        model.hud.view?.run(actionFadeIn)
//        model.viewTitle?.run(actionFadeOut)
    }
}
