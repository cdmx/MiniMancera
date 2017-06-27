import SpriteKit

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    override func timeOut(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let model:MOptionReformaCrossing = controller.model
        model.strategyWait()
        
        let transition:SKTransition = model.actions.transitionCrossFade
        let newScene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller)
        
        guard
            
            let view:SKView = controller.view as? SKView
        
        else
        {
            return
        }
        
        view.presentScene(newScene, transition:transition)
    }
}
