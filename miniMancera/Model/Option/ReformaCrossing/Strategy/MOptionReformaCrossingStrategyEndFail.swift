import SpriteKit

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    let gameOver:MOptionReformaCrossingGameOverProtocol
    
    init(gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        self.gameOver = gameOver
    }
    
    override func timeOut(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let model:MOptionReformaCrossing = controller.model
        model.strategyWait()
        
        let transition:SKTransition = model.actions.transitionCrossFade
        let newScene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller,
            gameOver:gameOver)
        
        guard
            
            let view:SKView = controller.view as? SKView
        
        else
        {
            return
        }
        
        view.presentScene(newScene, transition:transition)
    }
}
