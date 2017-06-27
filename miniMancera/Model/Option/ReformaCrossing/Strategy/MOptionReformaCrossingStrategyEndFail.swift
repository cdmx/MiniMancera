import SpriteKit

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    let gameOver:MOptionReformaCrossingGameOverProtocol
    
    init(gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        self.gameOver = gameOver
    }
    
    override func timeOut(controller:COptionReformaCrossing)
    {
        controller.model.strategyWait()
        
        let newScene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller,
            gameOver:gameOver)
        
        controller.presentScene(newScene:newScene)
    }
}
